package com.illttueko.lrs.reservation.application;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.account.domain.GetStudentDTO;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.reservation.domain.*;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import com.illttueko.lrs.reservation.infrastructure.ReservationJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Date;

import static com.illttueko.config.BaseResponseStatus.*;
import static com.illttueko.lrs.account.domain.Student.stuFromDTO;
import static com.illttueko.lrs.lab.domain.Lab.labFromDTO;

@Service
public class RsvService {

    private final NoticeJpaRepository noticeJpaRepository;
    private final ReservationJpaRepository reservationJpaRepository;
    private final RsvProvider rsvProvider;

    @Autowired
    public RsvService(NoticeJpaRepository noticeJpaRepository, ReservationJpaRepository reservationJpaRepository, RsvProvider rsvProvider) {
        this.noticeJpaRepository = noticeJpaRepository;
        this.reservationJpaRepository = reservationJpaRepository;
        this.rsvProvider = rsvProvider;
    }

    public void updateNotice(NoticeDto noticeDto) throws BaseException {
        NoticeDto originNotice = rsvProvider.retrieveNotice();
        boolean isNotice = false;

        if(noticeDto.getNotice() != null) {
            originNotice.setNotice(noticeDto.getNotice());
            isNotice = true;
        }
        if(noticeDto.getRule() != null) {
            originNotice.setRule(noticeDto.getRule());
        }

        Notice newNotice = originNotice.toEntity();

        try {
            noticeJpaRepository.save(newNotice);
        } catch (Exception exception) {
            if(isNotice) {
                throw new BaseException(FAILED_TO_UPDATE_NOTICE);
            } else{
                throw new BaseException(FAILED_TO_UPDATE_RULE);
            }
        }
    }

    public void createReservation(PostReservationReq postReservationReq, Long studentIdx, String stuName) throws BaseException {
        GetStudentDTO getStudentDTO = rsvProvider.retrieveStudent(studentIdx);
        GetLabDTO getLabDTO = rsvProvider.retrieveLab(postReservationReq.getClassNo());
        ReservationDTO reservationDTO;

        /* 시간 형식 포맷 */
        String time = "00"+postReservationReq.getTime();
        String startTimeFormat = " " + time.substring(time.length()-2) + ":00:00";
        String endTimeFormat = " " + time.substring(time.length()-2) + ":50:00";

        Timestamp startTime = Timestamp.valueOf(postReservationReq.getDate()+startTimeFormat);
        Timestamp endTime = Timestamp.valueOf(postReservationReq.getDate()+endTimeFormat);

        // 요일 구하기
        Date getDate = postReservationReq.getDate();
        int getYear = getDate.getYear();
        int getmonth = getDate.getMonth();
        int getDay = getDate.getDate();

        LocalDate date = LocalDate.of(getYear+1900, getmonth+1, getDay);
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        int dayOfWeekNum = dayOfWeek.getValue();

        /* 평일인 경우 */
        if(dayOfWeekNum >= 1 && dayOfWeekNum <=5) {
            /* 9시~17시 사이면 자동 승인, 아니면 승인 대기 */
            if(postReservationReq.getTime() >= 9 && postReservationReq.getTime() < 17) {
                reservationDTO = new ReservationDTO(postReservationReq.getClassNo(), stuFromDTO(getStudentDTO), stuName, labFromDTO(getLabDTO), postReservationReq.getSeatNo(), startTime, endTime, 0,false);
            } else {
                reservationDTO = new ReservationDTO(postReservationReq.getClassNo(), stuFromDTO(getStudentDTO), stuName, labFromDTO(getLabDTO), postReservationReq.getSeatNo(), startTime, endTime, 1,false);
            }
        }
        /* 주말인 경우 */
        else{
            reservationDTO = new ReservationDTO(postReservationReq.getClassNo(), stuFromDTO(getStudentDTO), stuName, labFromDTO(getLabDTO), postReservationReq.getSeatNo(), startTime, endTime, 1,false);
        }

        Reservation reservation = Reservation.RsvfromDTO(reservationDTO);
        try {
            reservationJpaRepository.save(reservation);
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_INSERT_RESERVATION);
        }
    }

    public void deleteReservation(String rsvIdx) throws BaseException{
        try {
            Long idx = Long.parseLong(rsvIdx);
            reservationJpaRepository.deleteById(idx);
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }

    public void updateReservation(PatchRsvReq patchRsvReq) throws BaseException{
        try {
            reservationJpaRepository.updateReservation(patchRsvReq.getApprovalFlag(), patchRsvReq.getIdx());
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }

}
