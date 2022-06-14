package com.illttueko.lrs.account.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CreateStudentDto {

    private int studentNO;
    private String password;
    private String name;

    public Student toEntity(){
        return Student.builder()
                .studentNo(studentNO)
                .password(password)
                .name(name).build();
    }
}
