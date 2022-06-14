package com.illttueko.utils.jwt;

import com.illttueko.config.BaseException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static com.illttueko.config.BaseResponseStatus.PERMISSION_DENY;

@Component
@RequiredArgsConstructor
public class JwtInterceptor implements HandlerInterceptor {

    private final JwtService jwtService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws BaseException {
        try {
            JwtParserDto jwtParserDto = jwtService.getData();

            if (jwtParserDto.getRole().equals("STUDENT")){
                return true;
            }

            if(jwtParserDto.getRole().equals("ADMIN")){
                return true;
            }
        }catch (Exception exception){
            try {
                response.sendRedirect("/auth/login");
            } catch (IOException e) {
                throw new BaseException(PERMISSION_DENY);
            }
        }

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }

}
