package com.illttueko.lrs.account.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Admin {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // ID
    @Column(nullable = false)
    private String adminId;

    // 패스워드
    @Column(nullable = false)
    private String password;

    // 이름
    @Column(nullable = false)
    private String name;

    //역할
    @Column(nullable = false)
    private int role;

    @Builder
    public Admin(Long idx, String adminId, String password, String name, byte role) {
        this.idx = idx;
        this.adminId = adminId;
        this.password = password;
        this.name = name;
        this.role = role;
    }
}
