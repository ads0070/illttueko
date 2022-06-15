package com.illttueko.lrs.schedule.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.lab.infrastructure.LabJpaRepository;
import com.illttueko.lrs.schedule.domain.TimetableDto;
import com.illttueko.lrs.schedule.infrastructure.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;
import static com.illttueko.lrs.lab.domain.Lab.labFromDTO;

@Service
public class ScheduleProvider {

    @Autowired
    private final ScheduleRepository scheduleRepository;
    private final LabJpaRepository labJpaRepository;

    public ScheduleProvider(ScheduleRepository scheduleRepository, LabJpaRepository labJpaRepository) {
        this.scheduleRepository = scheduleRepository;
        this.labJpaRepository = labJpaRepository;
    }

    /** 강의실로 해당하는 강의실 시간표 모두 조회 **/
    public List<TimetableDto> retrieveSceduleList(int classNo) throws BaseException{
        GetLabDTO getLabDTO = labJpaRepository.findByClassNo(classNo);
        Lab lab = labFromDTO(getLabDTO);
        try{
            return scheduleRepository.findAllByLab(lab);
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
