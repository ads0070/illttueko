package com.illttueko.lrs.reservation.domain;

import com.illttueko.lrs.account.domain.Student;
import com.illttueko.lrs.lab.domain.Lab;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class ReservationDTO {
    private int classNo;    // 실습실 번호
    private Student student;
    private String name;
    private Lab lab;
    private int seatNo;     // 좌석 번호
    private Timestamp startTime;
    private Timestamp endTime;
    private int approvalFlag;
    private Boolean returnFlag;
}
