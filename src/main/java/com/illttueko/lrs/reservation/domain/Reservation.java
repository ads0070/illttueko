package com.illttueko.lrs.reservation.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.illttueko.lrs.inquiry.domain.Broken;
import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.inquiry.domain.Inquiry;
import com.illttueko.lrs.account.domain.Student;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Entity
@DynamicInsert
@NoArgsConstructor
@Component
public class Reservation {

    // 자동 증가 인덱스
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    // 예약자 학번
    @ManyToOne
    @JoinColumn(name = "studentNo", nullable = false)
    private Student student;

    // 이름
    @Column(nullable = false)
    private String name;

    // 실습실 번호
    @ManyToOne
    @JsonManagedReference
    @JoinColumn(name = "classNo", nullable = false)
    private Lab lab;

    // 좌석번호
    @Column(nullable = false)
    private int seatNo;

    // 예약 시작시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp startTime;

    // 예약 종료시간
    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Timestamp endTime;

    // 승인상태 (0:승인불필요, 1:승인대기, 2:승인완료, 3:승인거부)
    @Column(nullable = false)
    private int approvalFlag;

    // 생성시간
    @Column(columnDefinition = "TIMESTAMP")
    @ColumnDefault("CURRENT_TIMESTAMP")
    private Timestamp createAt;

    // 수정시간
    @Column(columnDefinition = "TIMESTAMP")
    private Timestamp updateAt;

    // 반납상태 (0:반납전, 1:반납완료)
    @Column(nullable = false)
    @ColumnDefault("false")
    private boolean returnFlag;

    // 매핑
    @OneToOne(mappedBy = "reservation")
    private Inquiry inquiry;

    // 매핑
    @OneToOne(mappedBy = "reservation")
    private Broken broken;

    @Builder
    public Reservation(Long idx, Student student, String name, Lab lab, int seatNo, Timestamp startTime, Timestamp endTime, byte approvalFlag, Timestamp createAt, Timestamp updateAt, Boolean returnFlag) {
        this.idx = idx;
        this.student = student;
        this.name = name;
        this.lab = lab;
        this.seatNo = seatNo;
        this.startTime = startTime;
        this.endTime = endTime;
        this.approvalFlag = approvalFlag;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.returnFlag = returnFlag;
    }

    public static Reservation RsvfromDTO(ReservationDTO reservationDTO){
        return Reservation.builder()
                .idx(null)
                .student(reservationDTO.getStudent())
                .name(reservationDTO.getName())
                .lab(reservationDTO.getLab())
                .seatNo(reservationDTO.getSeatNo())
                .startTime(reservationDTO.getStartTime())
                .endTime(reservationDTO.getEndTime())
                .approvalFlag((byte) reservationDTO.getApprovalFlag())
                .createAt(null)
                .updateAt(null)
                .returnFlag(reservationDTO.getReturnFlag())
                .build();
    }
}
