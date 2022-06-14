package com.illttueko.lrs.account.presentation;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponse;
import com.illttueko.lrs.account.application.AuthProvide;
import com.illttueko.lrs.account.application.AuthService;
import com.illttueko.lrs.account.domain.PostLoginReq;
import com.illttueko.lrs.account.domain.PostUserInfoReq;
import com.illttueko.utils.jwt.JwtParserDto;
import com.illttueko.utils.jwt.JwtService;
import com.mysql.cj.util.StringUtils;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;
    private final AuthProvide authProvide;

    private final JwtService jwtService;

    public AuthController(AuthService authService, AuthProvide authProvide, JwtService jwtService) {
        this.authService = authService;
        this.authProvide = authProvide;
        this.jwtService = jwtService;
    }

    /** 로그인 화면 API **/
    @GetMapping("/login")
    public String loginPage(){
        return "login/login";
    }

    /** 로그인 API **/
    @ResponseBody
    @PostMapping("/login")
    public String postLogin(@RequestBody PostLoginReq postLoginReq, HttpServletResponse response){
        String userId = postLoginReq.getUserId();
        String result;
        try {
            if(StringUtils.isStrictlyNumeric(userId)){
                result = authProvide.postLoginByStudent(postLoginReq);
            }else{
                result = authProvide.postLoginByAdmin(postLoginReq);
            }
            if(result != null) {
                ResponseCookie cookie = ResponseCookie.from("JWT", result)
                        .maxAge(60*60)
                        .path("/")
                        .secure(true)
                        .sameSite("None")
                        .httpOnly(true)
                        .build();
                response.setHeader("Set-Cookie", cookie.toString());

                if (jwtService.getData().getUserId().equals(postLoginReq.getUserPwd())){
                    return "first";
                }
                return "true";
            }else {
                return "false";
            }
        }catch (BaseException exception){
            return exception.getMessage();
        }
    }

    /** 최초 로그인 화면 API **/
    @GetMapping("/first")
    public String firstLoginPage(Model model){

        try {
            JwtParserDto jwtParserDto = jwtService.getData();
            model.addAttribute("role", jwtParserDto.getRole());
            return "login/firstLogin";
        } catch (BaseException e) {
            throw new RuntimeException(e);
        }
    }

    /** 최초 로그인시 정보 수정 API **/
    @ResponseBody
    @PatchMapping("/first")
    public BaseResponse<String> updateUserInfo(@RequestBody PostUserInfoReq postUserInfoReq) throws BaseException{
        try {
            String role = jwtService.getData().getRole();
            String userId = jwtService.getData().getUserId();

            authService.updateUserInfo(postUserInfoReq, role, userId);
            String result = "성공적으로 수정되었습니다.";
            return new BaseResponse<>(result);
        }catch (BaseException exception){
            return new BaseResponse<>(exception.getStatus());
        }
    }
}
