package com.illttueko.lrs.reservation.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.reservation.domain.Notice;
import com.illttueko.lrs.reservation.domain.NoticeDto;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.illttueko.config.BaseResponseStatus.*;

@Service
public class RsvService {

    private final NoticeJpaRepository noticeJpaRepository;
    private final RsvProvider rsvProvider;

    @Autowired
    public RsvService(NoticeJpaRepository noticeJpaRepository, RsvProvider rsvProvider) {
        this.noticeJpaRepository = noticeJpaRepository;
        this.rsvProvider = rsvProvider;
    }

    public void updateNotice(NoticeDto noticeDto) throws BaseException {
        NoticeDto originNotice = rsvProvider.retrieveNotice();

        if(noticeDto.getNotice() != null) {
            originNotice.setNotice(noticeDto.getNotice());
        }
        if(noticeDto.getRule() != null) {
            originNotice.setRule(noticeDto.getRule());
        }

        Notice newNotice = originNotice.toEntity();

        try {
            noticeJpaRepository.save(newNotice);
        } catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }

}
