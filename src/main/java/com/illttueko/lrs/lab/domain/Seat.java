package com.illttueko.lrs.lab.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Seat {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 실습실 번호
    @ManyToOne
    @JoinColumn(name = "classNo", nullable = false)
    private Lab lab;

    // 좌석 번호
    @Column(nullable = false)
    private int seatNo;

    // 고장 상태 (0:정상, 1:고장)
    @Column(nullable = false)
    @ColumnDefault("false")
    private boolean flag;

    @Builder
    public Seat(Long idx, Lab lab, int seatNo, boolean flag) {
        this.idx = idx;
        this.lab = lab;
        this.seatNo = seatNo;
        this.flag = flag;
    }
}
