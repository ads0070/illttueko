package com.illttueko.lrs.schedule.domain;

import com.illttueko.lrs.lab.domain.Lab;

import java.sql.Timestamp;

public interface TimetableDto {
    Long getIdx();
    String getDay();
    Timestamp getEndTime();
    Timestamp getStartTime();
    String getSubject();
    Lab getLab();
}
