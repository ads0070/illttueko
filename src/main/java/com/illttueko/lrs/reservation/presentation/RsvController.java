package com.illttueko.lrs.reservation.presentation;

import com.illttueko.lrs.reservation.application.RsvProvider;
import com.illttueko.lrs.reservation.application.RsvService;
import com.illttueko.lrs.reservation.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/reservation")
public class RsvController {

    @Autowired
    private final RsvProvider rsvProvider;
    @Autowired
    private final RsvService rsvService;

    public RsvController(RsvProvider rsvProvider, RsvService rsvService) {
        this.rsvProvider = rsvProvider;
        this.rsvService = rsvService;
    }

    @ResponseBody
    @GetMapping("/notice")
    public NoticeDto retrieveNotice() {
        return rsvProvider.retrieveNotice();
    }

    @ResponseBody
    @PatchMapping("/notice")
    public String updateNotice(@RequestBody NoticeDto noticeDto) {
        try {
            rsvService.updateNotice(noticeDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

}