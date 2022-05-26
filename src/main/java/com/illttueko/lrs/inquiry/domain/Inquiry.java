package com.illttueko.lrs.inquiry.domain;

import com.illttueko.lrs.reservation.domain.Reservation;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Inquiry {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 예약정보 idx
    @OneToOne
    @JoinColumn(name = "rsvIdx", nullable = false)
    private Reservation reservation;

    // 내용
    @Column(nullable = false)
    private String content;

    //생성시간(일반 문의 날짜)
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    @ColumnDefault("CURRENT_TIMESTAMP")
    private Timestamp createAt;

    @Builder
    public Inquiry(Long idx, Reservation reservation, String content, Timestamp createAt) {
        this.idx = idx;
        this.reservation = reservation;
        this.content = content;
        this.createAt = createAt;
    }
}
