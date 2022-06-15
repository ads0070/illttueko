package com.illttueko.lrs.schedule.domain;

import com.illttueko.lrs.lab.domain.Lab;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class CreateClassDto {
    private Lab lab;
    private String day;
    private Timestamp startTime;
    private Timestamp endTime;
    private String subject;

    public Timetable toEntity(){
        return Timetable.builder()
                .lab(lab)
                .day(day)
                .startTime(startTime)
                .endTime(endTime)
                .subject(subject)
                .build();
    }

}
