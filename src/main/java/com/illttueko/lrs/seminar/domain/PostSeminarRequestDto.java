package com.illttueko.lrs.seminar.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Getter
@NoArgsConstructor
public class PostSeminarRequestDto {
    private Timestamp startTime;
    private Timestamp endTime;
    private String owner;
    private String seminarInfo;
    private int classNo;


    public PostSeminarRequestDto(Timestamp startTime, Timestamp endTime, String owner, String seminarInfo, int classNo) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.owner = owner;
        this.seminarInfo = seminarInfo;
        this.classNo = classNo;
    }

}
