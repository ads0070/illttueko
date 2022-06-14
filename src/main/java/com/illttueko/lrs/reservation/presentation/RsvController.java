package com.illttueko.lrs.reservation.presentation;

import com.illttueko.utils.jwt.JwtService;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.reservation.application.RsvProvider;
import com.illttueko.lrs.reservation.application.RsvService;
import com.illttueko.lrs.reservation.domain.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reservation")
public class RsvController {
    @Autowired
    private final RsvProvider rsvProvider;
    @Autowired
    private final RsvService rsvService;
    @Autowired
    private final JwtService jwtService;

    public RsvController(RsvProvider rsvProvider, RsvService rsvService, JwtService jwtService) {
        this.rsvProvider = rsvProvider;
        this.rsvService = rsvService;
        this.jwtService = jwtService;
    }

    /** 공지 관리 화면 API **/
    @RequestMapping("/notice-management")
    public String noticeManagement(Model model) {
        try {
            NoticeDto noticeDto = rsvProvider.retrieveNotice();
            model.addAttribute("notice",noticeDto.getNotice());
            model.addAttribute("rule",noticeDto.getRule());
            return "notice/noticeManagement";
        } catch(Exception exception){
            return exception.getMessage();
        }
    }


    /** 공지 및 규칙 조회 API **/
    @ResponseBody
    @GetMapping("/notice")
    public BaseResponse<NoticeDto> retrieveNotice() {

        try {
            NoticeDto noticeDto = rsvProvider.retrieveNotice();
            return new BaseResponse<>(noticeDto);
        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }


    /** 공지 또는 규칙 수정 API **/
    @ResponseBody
    @PatchMapping("/notice")
    public BaseResponse<String> updateNotice(@RequestBody NoticeDto noticeDto) {
        String result = "";
        try {
            rsvService.updateNotice(noticeDto);
            result = "변경되었습니다.";
            return new BaseResponse<>(result);
        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 예약 화면 API **/
    @GetMapping("/situation")
    public String retrieveReservation(HttpServletRequest request){
        return "reservation/rsvLab";
    }

    /** 실습실 예약 API **/
    @ResponseBody
    @PostMapping("")
    public BaseResponse<String> createReservation(@RequestBody PostReservationReq postReservationReq){
        String result = "";
        try {
            rsvService.createReservation(postReservationReq, jwtService.getData().getIdx(), jwtService.getData().getName());
            result = "예약되었습니다.";
            return new BaseResponse<>(result);
        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 예약 현황 조회 API (+검색) **/
    @ResponseBody
    @GetMapping("")
    public BaseResponse<List<GetResvationDTO>> retrieveReservation(@RequestParam(name = "date", required = false) String date, @RequestParam(name = "classNo", required = false, defaultValue = "0") int classNo){

        try {
            String role = jwtService.getData().getRole();

            if(date == null) {
                if(role.equals("STUDENT")) {
                    List<GetResvationDTO> getResvationRes = rsvProvider.retrieveUserRsv(jwtService.getData().getIdx());
                    return new BaseResponse<>(getResvationRes);
                } else if(role.equals("ADMIN")) {
                    List<GetResvationDTO> getResvationRes = rsvProvider.retrieveUsersRsv();
                    return new BaseResponse<>(getResvationRes);
                }
            }

            List<GetResvationDTO> getResvationRes = rsvProvider.retrieveReservations(date, classNo);
            return new BaseResponse<>(getResvationRes);
        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}