package com.illttueko.lrs.domain.seminar;

import com.illttueko.lrs.domain.classes.Classes;
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
public class Seminar {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 실습실 번호
    @ManyToOne
    @JoinColumn(name = "classNo", nullable = false)
    private Classes classes;

    // 시작시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp startTime;

    // 종료시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp endTime;

    // 사유
    @Column(nullable = false)
    private String seminarInfo;

    // 주최자
    @Column(nullable = false)
    private String owner;

    @Builder
    public Seminar(Long idx, Classes classes, Timestamp startTime, Timestamp endTime, String seminarInfo, String owner) {
        this.idx = idx;
        this.classes = classes;
        this.startTime = startTime;
        this.endTime = endTime;
        this.seminarInfo = seminarInfo;
        this.owner = owner;
    }
}
