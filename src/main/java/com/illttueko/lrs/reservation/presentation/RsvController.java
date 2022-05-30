package com.illttueko.lrs.reservation.presentation;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.reservation.application.RsvProvider;
import com.illttueko.lrs.reservation.application.RsvService;
import com.illttueko.lrs.reservation.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    /** 공지 관리 화면 **/
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


    /** 공지사항 및 규칙 조회 API **/
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


    /** 공지사항 또는 규칙 수정 API **/
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

}