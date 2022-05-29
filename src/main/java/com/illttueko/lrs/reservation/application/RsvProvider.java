package com.illttueko.lrs.reservation.application;

import com.illttueko.lrs.reservation.domain.NoticeDto;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RsvProvider {

    @Autowired
    private final NoticeJpaRepository noticeJpaRepository;

    public RsvProvider(NoticeJpaRepository noticeJpaRepository) {
        this.noticeJpaRepository = noticeJpaRepository;
    }

    public NoticeDto retrieveNotice() {
        return noticeJpaRepository.findByIdx(1);
    }

}
