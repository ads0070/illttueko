package com.illttueko.lrs.account.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UpdateStudentDto {

    private Long idx;
    private int studentNo;
    private String name;
    private int warn;

    public Student toEntity(){
        return Student.builder()
                .idx(idx)
                .studentNo(studentNo)
                .name(name)
                .warn(warn)
                .build();
    }
}
