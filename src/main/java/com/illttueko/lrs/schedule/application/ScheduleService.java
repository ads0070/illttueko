package com.illttueko.lrs.schedule.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.lab.application.LabService;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.schedule.domain.CreateClassDto;
import com.illttueko.lrs.schedule.domain.PostClassRequestDto;
import com.illttueko.lrs.schedule.infrastructure.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class ScheduleService {
    private final ScheduleRepository scheduleRepository;
    private final ScheduleProvider scheduleProvider;
    private final LabService labService;

    @Autowired
    public ScheduleService(ScheduleRepository scheduleRepository, ScheduleProvider scheduleProvider, LabService labService) {
        this.scheduleRepository = scheduleRepository;
        this.scheduleProvider = scheduleProvider;
        this.labService = labService;
    }

    public String createClass(PostClassRequestDto dto) throws BaseException{
        GetLabDTO getLabDTO = labService.getInfo(dto.getClassNo());
        Lab lab = Lab.labFromDTO(getLabDTO);

        String stime = "2022-04-12 "+dto.getStartTime() + ":00";
        String etime = "2022-04-12 "+dto.getEndTime() + ":00";
        Timestamp startTime = Timestamp.valueOf(stime);
        Timestamp entTime = Timestamp.valueOf(etime);

        CreateClassDto createClassDto = new CreateClassDto(lab,dto.getDay(),startTime,entTime,dto.getSubject());

        try {
                if(scheduleRepository.findByStartTimeAndDay(createClassDto.getStartTime(),createClassDto.getDay()) == null){
                    scheduleRepository.save(createClassDto.toEntity());
                    return "success";
                }
                 return "fail";
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
