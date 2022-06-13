package com.illttueko.lrs.reservation.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.account.domain.GetStudentDTO;
import com.illttueko.lrs.account.infrastructure.StudentJpaRepository;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.infrastructure.LabJpaRepository;
import com.illttueko.lrs.reservation.domain.GetResvationDTO;
import com.illttueko.lrs.reservation.domain.NoticeDto;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import com.illttueko.lrs.reservation.infrastructure.ReservationJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import static com.illttueko.config.BaseResponseStatus.*;
import static com.illttueko.lrs.account.domain.Student.stuFromDTO;
import static com.illttueko.lrs.lab.domain.Lab.labFromDTO;

@Service
public class RsvProvider {

    @Autowired
    private final NoticeJpaRepository noticeJpaRepository;
    @Autowired
    private final StudentJpaRepository studentJpaRepository;
    @Autowired
    private final LabJpaRepository labJpaRepository;
    @Autowired
    private final ReservationJpaRepository reservationJpaRepository;

    public RsvProvider(NoticeJpaRepository noticeJpaRepository, StudentJpaRepository studentJpaRepository, LabJpaRepository labJpaRepository, ReservationJpaRepository reservationJpaRepository) {
        this.noticeJpaRepository = noticeJpaRepository;
        this.studentJpaRepository = studentJpaRepository;
        this.labJpaRepository = labJpaRepository;
        this.reservationJpaRepository = reservationJpaRepository;
    }

    public NoticeDto retrieveNotice() throws BaseException {
        try {
            NoticeDto noticeDto = noticeJpaRepository.findByIdx(1);
            if(noticeDto == null) {
                throw new BaseException(NO_LOOKUP_VALUE);
            }
            return noticeDto;
        } catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }

    public GetStudentDTO retrieveStudent(Long studentId) throws BaseException {
        try {
            GetStudentDTO getStudentDTO = studentJpaRepository.findByIdx(studentId);
            if(getStudentDTO == null) {
                throw new BaseException(NO_LOOKUP_VALUE);
            }
            return getStudentDTO;
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_RETRIEVE_STUDENT);
        }
    }

    public GetLabDTO retrieveLab(int classNo) throws BaseException {
        try{
            GetLabDTO getLabDTO = labJpaRepository.findByClassNo(classNo);
            if(getLabDTO == null) {
                throw new BaseException(NO_LOOKUP_VALUE);
            }
            return getLabDTO;
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_RETRIEVE_LAB);
        }
    }

    public List<GetResvationDTO> retrieveReservations(String date, int classNo) throws BaseException {
        GetLabDTO getLabDTO = retrieveLab(classNo);
        LocalDate localDate = LocalDate.parse(date);
        LocalDateTime localDateTime = localDate.atStartOfDay();
        LocalDateTime nextDateTime = localDateTime.plusDays(1);

        try{
            List<GetResvationDTO> getResvationRes = reservationJpaRepository.findAllByLabAndStartTimeBetween(labFromDTO(getLabDTO), Timestamp.valueOf(localDateTime), Timestamp.valueOf(nextDateTime));
            if(getResvationRes == null) {
                throw new BaseException(NO_LOOKUP_VALUE);
            }
            return getResvationRes;
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_RETRIEVE_RESERVATION);
        }
    }

    public List<GetResvationDTO> retrieveUserRsv(Long studentIdx) throws BaseException {
        GetStudentDTO getStudentDTO = retrieveStudent(studentIdx);
        try{
            List<GetResvationDTO> getResvationRes = reservationJpaRepository.findAllByStudent(stuFromDTO(getStudentDTO));
            if(getResvationRes == null) {
                throw new BaseException(NO_LOOKUP_VALUE);
            }
            return getResvationRes;
        } catch (Exception exception) {
            throw new BaseException(FAILED_TO_RETRIEVE_RESERVATION);
        }
    }
}
