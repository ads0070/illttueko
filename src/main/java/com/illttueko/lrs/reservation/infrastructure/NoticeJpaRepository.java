package com.illttueko.lrs.reservation.infrastructure;

import com.illttueko.lrs.reservation.domain.Notice;
import com.illttueko.lrs.reservation.domain.NoticeDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeJpaRepository extends JpaRepository<Notice, Long> {
    NoticeDto findByIdx(long idx);
}
