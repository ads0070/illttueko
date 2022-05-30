package com.illttueko.lrs.reservation.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.reservation.domain.NoticeDto;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.illttueko.config.BaseResponseStatus.*;

@Service
public class RsvProvider {

    @Autowired
    private final NoticeJpaRepository noticeJpaRepository;

    public RsvProvider(NoticeJpaRepository noticeJpaRepository) {
        this.noticeJpaRepository = noticeJpaRepository;
    }

    public NoticeDto retrieveNotice() throws BaseException {
        try {
            NoticeDto noticeDto = noticeJpaRepository.findByIdx(1);
            if(noticeDto == null) {
                throw new BaseException(DATABASE_ERROR);
            }
            return noticeDto;
        } catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }

}
