package com.illttueko.utils.jwt;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class JwtParserDto {
    private Long idx;
    private String userId;
    private String name;
    private String role;
}
