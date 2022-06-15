package com.illttueko.lrs.seminar.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.lab.application.LabService;
import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.domain.Lab;
import com.illttueko.lrs.seminar.domain.CreateSeminarDto;
import com.illttueko.lrs.seminar.domain.PostSeminarRequestDto;
import com.illttueko.lrs.seminar.infrastructure.SeminarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class SeminarService {
    private final SeminarRepository seminarRepository;
    private final SeminarProvider seminarProvider;
    private final LabService labService;

    @Autowired
    public SeminarService(SeminarRepository seminarRepository, SeminarProvider seminarProvider, LabService labService) {
        this.seminarRepository = seminarRepository;
        this.seminarProvider = seminarProvider;
        this.labService = labService;
    }


    public String createSeminar(PostSeminarRequestDto dto) throws BaseException{
        GetLabDTO getLabDTO = labService.getInfo(dto.getClassNo());
        Lab lab = Lab.labFromDTO(getLabDTO);

        CreateSeminarDto createSeminarDto = new CreateSeminarDto(dto.getEndTime(), dto.getOwner(), dto.getSeminarInfo(), dto.getStartTime(),lab);

        try{
            if(seminarRepository.findByStartTimeAndLab(createSeminarDto.getStartTime(),createSeminarDto.getLab()) == null){
                seminarRepository.save(createSeminarDto.toEntity());
                return  "success";
            }
            return "fail";
        }catch(Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
