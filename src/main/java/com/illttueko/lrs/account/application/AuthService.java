package com.illttueko.lrs.account.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.account.domain.PostUserInfoReq;
import com.illttueko.lrs.account.infrastructure.AdminRepository;
import com.illttueko.lrs.account.infrastructure.StudentRepository;
import com.illttueko.utils.SHA256;
import com.illttueko.utils.jwt.JwtService;
import org.springframework.stereotype.Service;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class AuthService {
    private final StudentRepository studentRepository;
    private final AdminRepository adminRepository;
    private final JwtService jwtService;

    public AuthService(StudentRepository studentRepository, AdminRepository adminRepository, JwtService jwtService) {
        this.studentRepository = studentRepository;
        this.adminRepository = adminRepository;
        this.jwtService = jwtService;
    }

    public void updateUserInfo(PostUserInfoReq postUserInfoReq, String role, String userId) throws BaseException {
        try{
            int result;

            String encodePwd = new SHA256().encrypt(postUserInfoReq.getUserPwd());
            String email = postUserInfoReq.getEmail();
            String phone = postUserInfoReq.getPhone();

            if (role.equals("STUDENT")){
                result = studentRepository.updateUserInfo(encodePwd, phone, email, Integer.parseInt(userId));
            }else{
                result = adminRepository.updateUserInfo(encodePwd, userId);
            }
            if (result == 0) {
                throw new BaseException(DATABASE_ERROR);
            }
        } catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
