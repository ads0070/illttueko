package com.illttueko.lrs.seminar.domain;

import com.illttueko.lrs.lab.domain.Lab;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class CreateSeminarDto {
    private Timestamp endTime;
    private String owner;
    private String seminarInfo;
    private Timestamp startTime;
    private Lab lab;

    public Seminar toEntity(){
        return Seminar.builder()
                .endTime(endTime)
                .owner(owner)
                .seminarInfo(seminarInfo)
                .startTime(startTime)
                .lab(lab)
                .build();
    }
}
