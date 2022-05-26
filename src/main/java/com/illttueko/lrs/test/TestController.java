package com.illttueko.lrs.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/test")
public class TestController {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    public TestController() {}

    @GetMapping("/")
    public String hello() {
        return "index";
    }


    /**
     * 로그 테스트 API
     * [GET] /test/log
     * @return String
     */
//    @ResponseBody
    @GetMapping("/log")
    public String getAll() {
        System.out.println("테스트");
//        trace, debug 레벨은 Console X, 파일 로깅 X
//        logger.trace("TRACE Level 테스트");
//        logger.debug("DEBUG Level 테스트");

//        info 레벨은 Console 로깅 O, 파일 로깅 X
        logger.info("INFO Level 테스트");
//        warn 레벨은 Console 로깅 O, 파일 로깅 O
        logger.warn("Warn Level 테스트");
//        error 레벨은 Console 로깅 O, 파일 로깅 O (app.log 뿐만 아니라 error.log 에도 로깅 됨)
//        app.log 와 error.log 는 날짜가 바뀌면 자동으로 *.gz 으로 압축 백업됨
        logger.error("ERROR Level 테스트");

        return "index";
    }

    /** 문의 관리 화면 **/
    @RequestMapping("/inquiry")
    public String inquiryManagement() {
        return "inquiry/inquiryManagement";
    }

    /** 마이페이지 화면 **/
    @RequestMapping("/mypage")
    public String myPage() {
        return "mypage/mypage";
    }

    /** 공지 관리 화면 **/
    @RequestMapping("/notice")
    public String noticeManagement() {
        return "notice/noticeManagement";
    }

    /** 세미나 등록 화면 **/
    @RequestMapping("/seminarRegister")
    public String seminarRegistration() {
        return "seminar/seminarRegistration";
    }

    /** 세미나 관리 화면 **/
    @RequestMapping("/seminarManage")
    public String seminarManagement() {
        return "seminar/seminarManagement";
    }
}
