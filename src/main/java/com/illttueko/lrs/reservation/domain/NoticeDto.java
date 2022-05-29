package com.illttueko.lrs.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class NoticeDto {
    private Long idx;
    private String notice;
    private String rule;

    public Notice toEntity() {
        return Notice.builder()
                .idx(idx)
                .notice(notice)
                .rule(rule)
                .build();
    }
}
