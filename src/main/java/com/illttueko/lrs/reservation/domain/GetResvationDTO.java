package com.illttueko.lrs.reservation.domain;

import com.illttueko.lrs.account.domain.Student;
import com.illttueko.lrs.account.domain.StudentDTO;
import com.illttueko.lrs.lab.domain.Lab;

import java.sql.Timestamp;

public interface GetResvationDTO {
    Long getIdx();
    StudentDTO getStudent();
    String getName();
    Lab getLab();
    int getSeatNo();
    Timestamp getStartTime();
    Timestamp getEndTime();
    int getApprovalFlag();
    Timestamp getCreateAt();
}
