package com.illttueko.lrs.domain.classes;

import com.illttueko.lrs.domain.reservation.Reservation;
import com.illttueko.lrs.domain.seat.Seat;
import com.illttueko.lrs.domain.seminar.Seminar;
import com.illttueko.lrs.domain.timetable.Timetable;
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
public class Classes {

    // 강의실 번호
    @Id
    private int classNo;

    //강의실 최대 수용인원
    @Column(nullable = false)
    private int maxPeople;

    @OneToMany(mappedBy = "classes")
    private List<Seat> seatList = new ArrayList<Seat>();

    @OneToMany(mappedBy = "classes")
    private List<Reservation> reservationList = new ArrayList<Reservation>();

    @OneToMany(mappedBy = "classes")
    private List<Seminar> seminarList = new ArrayList<Seminar>();

    @OneToMany(mappedBy = "classes")
    private List<Timetable> timetableList = new ArrayList<Timetable>();

    @Builder
    public Classes(int classNo, int maxPeople) {
        this.classNo = classNo;
        this.maxPeople = maxPeople;
    }
}
