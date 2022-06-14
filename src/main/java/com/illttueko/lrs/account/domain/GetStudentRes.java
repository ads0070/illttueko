package com.illttueko.lrs.account.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GetStudentRes {
    private Long idx;
    private String email;
    private String name;
    private String phone;
    private int studentNo;
    private int warn;
}
