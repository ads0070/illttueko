package com.illttueko.lrs.inquiry.domain;

import com.illttueko.lrs.reservation.domain.Reservation;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Broken {

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

    //처리상태 (0:처리 전, 1:처리 중, 2:처리 완료)
    @Column(nullable = false)
    private int flag;

    //생성시간(고장 문의 날짜)
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    @ColumnDefault("CURRENT_TIMESTAMP")
    private Timestamp createAt;
}
