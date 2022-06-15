package com.illttueko.lrs.schedule.infrastructure;

import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.schedule.domain.Timetable;
import com.illttueko.lrs.schedule.domain.TimetableDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface ScheduleRepository extends JpaRepository <Timetable, Long> {
    TimetableDto findByStartTimeAndDay(Timestamp startTime,String endTime);
    List<TimetableDto> findAllByLab(Lab lab);

}
