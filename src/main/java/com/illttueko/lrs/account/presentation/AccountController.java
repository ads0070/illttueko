package com.illttueko.lrs.account.presentation;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.account.application.AccountProvider;
import com.illttueko.lrs.account.application.AccountService;
import com.illttueko.lrs.account.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    private final AccountProvider accountProvider;
    private final AccountService accountService;

    @Autowired
    public AccountController(AccountProvider accountProvider, AccountService accountService) {
        this.accountProvider = accountProvider;
        this.accountService = accountService;
    }

    /** 학생 관리 화면 API **/
    @RequestMapping("/user-management")
    public String userManagement() {
        return "user/userManagement";
    }

    /** 학생 조회 API **/
    @ResponseBody
    @GetMapping("/student")
    public BaseResponse<GetStudentRes> retrieveStudent(@RequestParam("idx")long idx){
        try {
            GetStudentRes getStudentRes = accountProvider.retrieveStudent(idx);
            return new BaseResponse<>(getStudentRes);

        }catch (BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 학생 전체 조회 API**/
    @ResponseBody
    @GetMapping("/students")
    public BaseResponse<List<StudentRes>> retrieveStudent(){
        try {
            List<StudentRes> studentDto = accountProvider.retrieveAllStudentAccount();
            return new BaseResponse<>(studentDto);

        }catch (BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 학생 추가 API**/
    @ResponseBody
    @PostMapping("/student")
    public BaseResponse<String> createStudent(@RequestBody CreateStudentDto dto){
        try {
             String a = accountService.createStudentAccount(dto);
            return new BaseResponse<>(a);
        }catch (BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 학생 정보 수정 API **/
    @ResponseBody
    @PatchMapping("/student")
    public BaseResponse<String> putStudent(@RequestBody UpdateStudentDto dto){
        try{
            String a = accountService.updateStudentAccount(dto);
            return new BaseResponse<>(a);
        }catch (BaseException exception){
            exception.getStackTrace();
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 학생 삭제 API **/
    @ResponseBody
    @DeleteMapping("/student")
    public BaseResponse<String> delStudent(@RequestParam("idx")long idx){
        try{
            String a = accountService.deleteStudentAccount(idx);
            return new BaseResponse<>(a);

        }catch (BaseException exception){
            exception.getStackTrace();
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    /** 마이페이지 화면 API **/
    @RequestMapping("/mypage")
    public String retrieveMyPage() {
        return "mypage/mypage";
    }

}
