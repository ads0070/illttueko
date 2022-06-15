package com.illttueko.lrs.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PatchRsvReq {
    private Long idx;
    private int approvalFlag;
}
