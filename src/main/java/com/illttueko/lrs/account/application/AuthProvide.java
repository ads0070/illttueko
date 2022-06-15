package com.illttueko.lrs.account.application;

import com.illttueko.config.BaseException;
import com.illttueko.config.BaseResponseStatus;
import com.illttueko.lrs.account.domain.Admin;
import com.illttueko.lrs.account.domain.PostLoginReq;
import com.illttueko.lrs.account.domain.Student;
import com.illttueko.lrs.account.infrastructure.AdminRepository;
import com.illttueko.lrs.account.infrastructure.StudentRepository;
import com.illttueko.utils.jwt.JwtService;
import com.illttueko.utils.SHA256;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.illttueko.config.BaseResponseStatus.PASSWORD_DECRYPTION_ERROR;
import static com.illttueko.config.BaseResponseStatus.PASSWORD_ENCRYPTION_ERROR;

@Service
public class AuthProvide {
    private final StudentRepository studentRepository;
    private final AdminRepository adminRepository;

    private final JwtService jwtService;

    public AuthProvide(StudentRepository studentRepository, AdminRepository adminRepository, JwtService jwtService) {
        this.studentRepository = studentRepository;
        this.adminRepository = adminRepository;
        this.jwtService = jwtService;
    }

    public String postLoginByStudent(PostLoginReq postLoginReq) throws BaseException{
        String encodePwd;
        try {
            if (postLoginReq.getUserId().equals(postLoginReq.getUserPwd())){
                encodePwd = postLoginReq.getUserPwd();
            }else{
                encodePwd = new SHA256().encrypt(postLoginReq.getUserPwd());
            }
        }catch (Exception exception){
            throw new BaseException(PASSWORD_ENCRYPTION_ERROR);
        }
        int userId = Integer.parseInt(postLoginReq.getUserId());
        Optional<Student> result = studentRepository.findByStudentNoAndPassword(userId, encodePwd);
        if (result.isEmpty()){
            return null;
        }else{
            Student student = result.get();

            String jwt = jwtService.createJwt(student.getIdx(), Integer.toString(student.getStudentNo()), student.getName(), "STUDENT");
            return jwt;
        }
    }

    public String postLoginByAdmin(PostLoginReq postLoginReq) throws BaseException {
        String encodePwd;
        try {
            encodePwd = new SHA256().encrypt(postLoginReq.getUserPwd());
        }catch (Exception ignored){
            throw new BaseException(PASSWORD_ENCRYPTION_ERROR);
        }
        String userId = postLoginReq.getUserId();
        Optional<Admin> result = adminRepository.findByAdminIdAndPassword(userId, encodePwd);
        if (result.isEmpty()){
            return null;
        }else{
            Admin admin = result.get();

            String jwt = jwtService.createJwt(admin.getIdx(), admin.getAdminId(), admin.getName(), "ADMIN");
            return jwt;
        }
    }
}
