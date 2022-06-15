package com.illttueko.lrs.seminar.presentation;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.seminar.application.SeminarProvider;
import com.illttueko.lrs.seminar.application.SeminarService;
import com.illttueko.lrs.seminar.domain.PostSeminarRequestDto;
import com.illttueko.lrs.seminar.domain.SeminarDto;
import com.illttueko.utils.jwt.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/seminar")
public class SeminarController {
    private final SeminarProvider seminarProvider;
    private final SeminarService seminarService;
    private final JwtService jwtService;

    @Autowired
    public SeminarController(SeminarProvider seminarProvider, SeminarService seminarService, JwtService jwtService) {
        this.seminarProvider = seminarProvider;
        this.seminarService = seminarService;
        this.jwtService = jwtService;
    }

    @GetMapping("/view")
    public String seminarView(){return "seminar/seminarRegistration";}

    @GetMapping("/view-manage")
    public String seminarManageView(){return "seminar/seminarManagement";}

    @ResponseBody
    @PostMapping("")
    public BaseResponse<String> createSeminar(@RequestBody PostSeminarRequestDto dto){
        try {
            String result = seminarService.createSeminar(dto);
            return new BaseResponse<>(result);
        }catch (BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    @ResponseBody
    @GetMapping("")
    public BaseResponse<List<SeminarDto>> retrieveSeminarList(){
        try{
            List<SeminarDto> seminarDtos = seminarProvider.retrieveSeminarList();
            return new BaseResponse<>(seminarDtos);
        }catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }
}
