package com.illttueko.lrs.reservation.presentation;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.reservation.application.RsvProvider;
import com.illttueko.lrs.reservation.application.RsvService;
import com.illttueko.lrs.reservation.domain.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/reservation")
public class RsvController {

    private final RsvProvider rsvProvider;
    private final RsvService rsvService;

    @Autowired
    public RsvController(RsvProvider rsvProvider, RsvService rsvService) {
        this.rsvProvider = rsvProvider;
        this.rsvService = rsvService;
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

    @RequestMapping("/a")
    public String GetSituationRsv(HttpServletResponse response){
        String refreshToken = "hibye";
        ResponseCookie cookie1 = ResponseCookie.from("refreshToken", refreshToken)
                .maxAge(30)
                .path("/")
                .secure(true)
                .sameSite("None")
                .httpOnly(true)
                .build();
        response.setHeader("Set-Cookie", cookie1.toString());
        return "index";
    }

    /** 예약 화면 API **/
    @GetMapping("/situation")
    public String retrieveReservation(HttpServletRequest request){
//        request.getHeader("Cookie");
//        Cookie[] cookies = request.getCookies();
//
//        String refresh = null;

//        for(Cookie c : cookies){
//            if (c.getName().equals("refreshToken")){
//                refresh = c.getValue();
//            }
//        }
//
//        if (refresh == null || refresh.equals("")){
//            return "redirect:index";
//        }else{
//            return "reservation/rsvLab";
//        }
        return "reservation/rsvLab";
    }

    /** 실습실 예약 API **/
    @ResponseBody
    @PostMapping("")
    public BaseResponse<String> createReservation(@RequestBody PostReservationReq postReservationReq){
        String result = "";
        //TODO: JWT에서 학생 식별자와 이름 추출하기
        try {
            rsvService.createReservation(postReservationReq, 1L,"안대현");
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

        //TODO: JWT에서 학생 식별자 추출하기
        try {
            if(date == null) {
                List<GetResvationDTO> getResvationRes = rsvProvider.retrieveUserRsv(1L);
                return new BaseResponse<>(getResvationRes);
            }

            List<GetResvationDTO> getResvationRes = rsvProvider.retrieveReservations(date, classNo);
            return new BaseResponse<>(getResvationRes);
        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}