package com.illttueko.lrs.lab.application;

import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.infrastructure.LabJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class LabService {

    private final LabJpaRepository labJpaRepository;

    public GetLabDTO getInfo(int classNo){
        return labJpaRepository.findByClassNo(classNo);
    }
}
