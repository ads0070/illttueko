package com.illttueko.lrs.assistant.domain;

import com.illttueko.lrs.reservation.domain.Reservation;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Student {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 학번
    @Column(nullable = false)
    private int studentNo;

    // 패스워드
    @Column(nullable = false)
    private String password;

    // 이름
    @Column(nullable = false)
    private String name;

    // 전화번호
    @Column(nullable = false)
    private String phone;

    // 이메일
    @Column(nullable = false)
    private String email;

    // 경고횟수
    @Column(nullable = false)
    @ColumnDefault("0")
    private int warn;

    @OneToMany(mappedBy = "student")
    private List<Warning> warningList = new ArrayList<Warning>();

    @OneToMany(mappedBy = "student")
    private List<Reservation> reservationList = new ArrayList<Reservation>();

    @Builder
    public Student(Long idx, int studentNo, String password, String name, String phone, String email, int warn) {
        this.idx = idx;
        this.studentNo = studentNo;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.warn = warn;
    }
}
