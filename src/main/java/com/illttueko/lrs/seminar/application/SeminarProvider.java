package com.illttueko.lrs.seminar.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.seminar.domain.SeminarDto;
import com.illttueko.lrs.seminar.infrastructure.SeminarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class SeminarProvider {

    @Autowired
    private final SeminarRepository seminarRepository;

    public SeminarProvider(SeminarRepository seminarRepository) {
        this.seminarRepository = seminarRepository;
    }

    public List<SeminarDto> retrieveSeminarList() throws BaseException{
        try{
            return seminarRepository.findAllBy();
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
