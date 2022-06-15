package com.illttueko.lrs.seminar.domain;

import com.illttueko.lrs.lab.domain.Lab;

import java.sql.Timestamp;

public interface SeminarDto {
    Long getIdx();
    Timestamp getStartTime();
    Timestamp getEndTime();
    String getOwner();
    String getSeminarInfo();
    Lab getLab();
}
