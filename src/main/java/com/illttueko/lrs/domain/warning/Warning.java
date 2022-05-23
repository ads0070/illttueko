package com.illttueko.lrs.domain.warning;

import com.illttueko.lrs.domain.student.Student;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Warning {

    //자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    //경고받은사람(학생 Idx)
    @ManyToOne
    @JoinColumn(name = "studentIdx", nullable = false)
    Student student;

    //경고 사유
    @Column(nullable = false)
    private String warnInfo;

    //경고 날짜
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    @ColumnDefault("CURRENT_TIMESTAMP")
    private Timestamp createAt;

    @Builder
    public Warning(Long idx, Student student, String warnInfo, Timestamp createAt) {
        this.idx = idx;
        this.student = student;
        this.warnInfo = warnInfo;
        this.createAt = createAt;
    }
}
