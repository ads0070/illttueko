package com.illttueko.lrs.account.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostLoginReq {
    private String userId;
    private String userPwd;
}
