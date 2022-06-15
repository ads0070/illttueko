package com.illttueko.lrs.account.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PatchUserInfosReq {
    private String phone;
    private String email;
}
