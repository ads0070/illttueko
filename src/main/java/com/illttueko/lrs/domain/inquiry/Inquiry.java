package com.illttueko.lrs.domain.inquiry;

import com.illttueko.lrs.domain.reservation.Reservation;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;

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

    // 처리상태 (0:대기, 1:처리)
    @Column(nullable = false)
    private boolean flag;

    @Builder
    public Inquiry(Long idx, Reservation reservation, String content, boolean flag) {
        this.idx = idx;
        this.reservation = reservation;
        this.content = content;
        this.flag = flag;
    }
}
