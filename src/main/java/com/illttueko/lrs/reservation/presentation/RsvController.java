package com.illttueko.lrs.reservation.presentation;

import com.illttueko.utils.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/reservation")
public class RsvController {

    @Autowired
    public RsvController() {}

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

    @GetMapping("/situation")
    public String GetHeader(HttpServletRequest request){
        request.getHeader("Cookie");
        Cookie[] cookies = request.getCookies();

        String refresh = null;

        for(Cookie c : cookies){
            if (c.getName().equals("refreshToken")){
                refresh = c.getValue();
            }
        }

        if (refresh == null || refresh.equals("")){
            return "redirect:index";
        }else{
            return "reservation/rsvLab";
        }
    }
}
