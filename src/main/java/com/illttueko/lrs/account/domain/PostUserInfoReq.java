package com.illttueko.lrs.account.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostUserInfoReq {
    private String userPwd;
    private String phone;
    private String email;
    private String name;
}
