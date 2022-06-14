package com.illttueko.utils.jwt;

import com.illttueko.config.BaseException;
import com.illttueko.config.secret.Secret;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

import static com.illttueko.config.BaseResponseStatus.EMPTY_JWT;
import static com.illttueko.config.BaseResponseStatus.INVALID_JWT;

@Service
public class JwtService {

    /*
    JWT 생성
    @param id
    @return String
     */
    public String createJwt(Long idx, String userId, String name, String role){
        Date now = new Date();
        return Jwts.builder()
                .setHeaderParam("type","jwt")
                .claim("idx",idx)
                .claim("userId", userId)
                .claim("name", name)
                .claim("role", role)
                .setIssuedAt(now)
                .setExpiration(new Date(System.currentTimeMillis()+1*(1000*60*60*24*365)))
                .signWith(SignatureAlgorithm.HS256, Secret.JWT_SECRET_KEY)
                .compact();
    }

    /*
    Header에서 쿠키 목록으로 JWT 추출
    @return String
     */
    public String getJwt(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        request.getHeader("Cookie");
        Cookie[] cookies = request.getCookies();

        String jwt = null;

        for(Cookie c : cookies){
            if (c.getName().equals("JWT")){
                jwt = c.getValue();
            }
        }
        return jwt;
    }

    /*
    JWT에서 data 추출
    @return int
    @throws BaseException
     */
    public JwtParserDto getData() throws BaseException
    {
        //1. JWT 추출
        String accessToken = getJwt();
        if(accessToken == null || accessToken.length() == 0){
            throw new BaseException(EMPTY_JWT);
        }else {

            // 2. JWT parsing
            Jws<Claims> claims;
            try {
                claims = Jwts.parser()
                        .setSigningKey(Secret.JWT_SECRET_KEY)
                        .parseClaimsJws(accessToken);
            } catch (Exception ignored) {
                throw new BaseException(INVALID_JWT);
            }

            // 3. userIdx 추출
            Long idx = claims.getBody().get("idx", Long.class);
            String name = claims.getBody().get("name", String.class);
            String role = claims.getBody().get("role", String.class);
            String userId;
            if (role.equals("STUDENT")){
                int userid = claims.getBody().get("userId",Integer.class);
                userId = Integer.toString(userid);
            }else{
                userId = claims.getBody().get("userId", String.class);
            }

            return new JwtParserDto(idx, userId, name, role);
        }
    }
}
