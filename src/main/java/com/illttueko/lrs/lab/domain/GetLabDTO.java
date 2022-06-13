package com.illttueko.lrs.lab.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GetLabDTO {
    private int classNo;
    private int maxPeople;
}
