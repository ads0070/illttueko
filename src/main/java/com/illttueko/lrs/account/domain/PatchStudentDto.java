package com.illttueko.lrs.account.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PatchStudentDto {

    private Long idx;
    private String email;
    private String name;
    private String password;
    private String phone;
    private int studentNo;
    private int warn;

    public Student toEntity() {
        return Student.builder()
                .idx(idx)
                .email(email)
                .name(name)
                .password(password)
                .phone(phone)
                .studentNo(studentNo)
                .warn(warn)
                .build();
    }

}
