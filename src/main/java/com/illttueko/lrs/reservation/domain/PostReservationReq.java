package com.illttueko.lrs.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class PostReservationReq {
    private int classNo;    // 실습실 번호
    private int seatNo;     // 좌석 번호
    private Date date;
    private int time;
}
