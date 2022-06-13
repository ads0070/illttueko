package com.illttueko.lrs.reservation.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.account.domain.GetStudentDTO;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.reservation.domain.*;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import com.illttueko.lrs.reservation.infrastructure.ReservationJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

        ReservationDTO reservationDTO = new ReservationDTO(postReservationReq.getClassNo(), stuFromDTO(getStudentDTO), stuName, labFromDTO(getLabDTO), postReservationReq.getSeatNo(), postReservationReq.getStartTime(), postReservationReq.getEndTime(), 1,false);
        Reservation reservation = Reservation.RsvfromDTO(reservationDTO);
        try {
            reservationJpaRepository.save(reservation);
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_INSERT_RESERVATION);
        }
    }

}
