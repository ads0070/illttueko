package com.illttueko.lrs.schedule.domain;

import com.illttueko.lrs.lab.domain.Classes;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Timetable {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 실습실 번호
    @ManyToOne
    @JoinColumn(name = "classNo", nullable = false)
    private Classes classes;

    // 요일
    @Column(nullable = false)
    private String day;

    // 시작시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp startTime;

    // 종료시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp endTime;

    // 과목명
    @Column(nullable = false)
    private String subject;

    @Builder
    public Timetable(Long idx, Classes classes, String day, Timestamp startTime, Timestamp endTime, String subject) {
        this.idx = idx;
        this.classes = classes;
        this.day = day;
        this.startTime = startTime;
        this.endTime = endTime;
        this.subject = subject;
    }
}
