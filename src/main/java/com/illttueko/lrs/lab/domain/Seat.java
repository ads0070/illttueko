package com.illttueko.lrs.lab.domain;

import com.illttueko.lrs.lab.domain.Classes;
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
    private Classes classes;

    // 좌석 번호
    @Column(nullable = false)
    private int seatNo;

    // 고장 상태 (0:정상, 1:고장)
    @Column(nullable = false)
    @ColumnDefault("false")
    private boolean flag;

    @Builder
    public Seat(Long idx, Classes classes, int seatNo, boolean flag) {
        this.idx = idx;
        this.classes = classes;
        this.seatNo = seatNo;
        this.flag = flag;
    }
}
