package com.illttueko.lrs.schedule.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PostClassRequestDto {
    private String day;
    private String startTime;
    private String endTime;
    private String subject;
    private int classNo;

    public PostClassRequestDto(String day, String startTime, String endTime, String subject, int classNo) {
        this.day = day;
        this.startTime = startTime;
        this.endTime = endTime;
        this.subject = subject;
        this.classNo = classNo;
    }
}
