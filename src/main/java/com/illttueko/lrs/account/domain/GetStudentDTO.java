package com.illttueko.lrs.account.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GetStudentDTO {
    private Long idx;
    private int studentNo;
    private String password;
    private String name;
    private String phone;
    private String email;
    private int warn;
}
