package com.illttueko.lrs.lab.domain;

import com.illttueko.lrs.reservation.domain.Reservation;
import com.illttueko.lrs.schedule.domain.Timetable;
import com.illttueko.lrs.seminar.domain.Seminar;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Entity
@NoArgsConstructor
@Component
public class Lab {

    // 강의실 번호
    @Id
    private int classNo;

    //강의실 최대 수용인원
    @Column(nullable = false)
    private int maxPeople;

    @OneToMany(mappedBy = "lab")
    private List<Seat> seatList = new ArrayList<Seat>();

    @OneToMany(mappedBy = "lab")
    private List<Reservation> reservationList = new ArrayList<Reservation>();

    @OneToMany(mappedBy = "lab")
    private List<Seminar> seminarList = new ArrayList<Seminar>();

    @OneToMany(mappedBy = "lab")
    private List<Timetable> timetableList = new ArrayList<Timetable>();

    @Builder
    public Lab(int classNo, int maxPeople) {
        this.classNo = classNo;
        this.maxPeople = maxPeople;
    }
}
