package com.illttueko.lrs.schedule.presentation;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.schedule.application.ScheduleProvider;
import com.illttueko.lrs.schedule.application.ScheduleService;
import com.illttueko.lrs.schedule.domain.PostClassRequestDto;
import com.illttueko.lrs.schedule.domain.TimetableDto;
import com.illttueko.utils.jwt.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    private final ScheduleProvider scheduleProvider;
    private final ScheduleService scheduleService;
    private final JwtService jwtService;

    @Autowired
    public ScheduleController(ScheduleProvider scheduleProvider, ScheduleService scheduleService, JwtService jwtService) {
        this.scheduleProvider = scheduleProvider;
        this.scheduleService = scheduleService;
        this.jwtService = jwtService;

    }

    /** 시간표 조회 화면 **/
    @GetMapping("/class-view")
    public String scheduleView(){return "schedule/schedule";}


    /** 시간표 관리 화면 **/
    @GetMapping("/class-management")
    public String scheduleManagement(){return "schedule/scheduleManagement";}


    /** 강의실 시간표 조회 **/
    @ResponseBody
    @GetMapping("/class")
    public BaseResponse<List<TimetableDto>> retrieveClassList(@RequestParam("classNo")int classNo){
        try{
            List<TimetableDto> timetableDtos = scheduleProvider.retrieveSceduleList(classNo);
            return new BaseResponse<>(timetableDtos);

        }catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 시간표 추가 API **/
    @ResponseBody
    @PostMapping("/class")
    public BaseResponse<String> createClass(@RequestBody PostClassRequestDto dto){
        try{
            String a = scheduleService.createClass(dto);
            return new BaseResponse<>(a);
        }catch (BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }
}
