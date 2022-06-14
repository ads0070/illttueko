package com.illttueko.lrs.reservation.infrastructure;

import com.illttueko.lrs.account.domain.Student;
import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.reservation.domain.GetResvationDTO;
import com.illttueko.lrs.reservation.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface ReservationJpaRepository extends JpaRepository<Reservation, Long> {
    List<GetResvationDTO> findAllByLabAndStartTimeBetween(Lab lab, Timestamp startTime, Timestamp endTime);
    List<GetResvationDTO> findAllByStudent(Student student);
    List<GetResvationDTO> findAllBy();
}
