package com.illttueko.lrs.reservation.application;

import com.illttueko.lrs.reservation.domain.Notice;
import com.illttueko.lrs.reservation.domain.NoticeDto;
import com.illttueko.lrs.reservation.infrastructure.NoticeJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RsvService {
    @Autowired
    private final NoticeJpaRepository noticeJpaRepository;
    @Autowired
    private final RsvProvider rsvProvider;

    public RsvService(NoticeJpaRepository noticeJpaRepository, RsvProvider rsvProvider) {
        this.noticeJpaRepository = noticeJpaRepository;
        this.rsvProvider = rsvProvider;
    }

    public void updateNotice(NoticeDto noticeDto) throws Exception {
        NoticeDto originNotice = rsvProvider.retrieveNotice();

        if(noticeDto.getNotice() != null) {
            originNotice.setNotice(noticeDto.getNotice());
        }
        if(noticeDto.getRule() != null) {
            originNotice.setRule(noticeDto.getRule());
        }

        Notice newNotice = originNotice.toEntity();
        noticeJpaRepository.save(newNotice);

        try {
            noticeJpaRepository.save(newNotice);
        } catch (Exception exception) {
            throw new Exception(exception);
        }
    }

}
