package com.illttueko.lrs.seminar.infrastructure;

import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.seminar.domain.Seminar;
import com.illttueko.lrs.seminar.domain.SeminarDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface SeminarRepository extends JpaRepository <Seminar, Long> {
    SeminarDto findByStartTimeAndLab(Timestamp startTime, Lab lab);
    List<SeminarDto> findAllBy();
}
