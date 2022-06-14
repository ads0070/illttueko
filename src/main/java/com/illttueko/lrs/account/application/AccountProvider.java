package com.illttueko.lrs.account.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.account.domain.GetStudentRes;
import com.illttueko.lrs.account.domain.StudentDto;
import com.illttueko.lrs.account.domain.StudentRes;
import com.illttueko.lrs.account.infrastructure.AccountJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.illttueko.config.BaseResponseStatus.*;

@Service
public class AccountProvider {

    @Autowired
    private final AccountJpaRepository accountJpaRepository;

    public AccountProvider(AccountJpaRepository accountJpaRepository) {
        this.accountJpaRepository = accountJpaRepository;
    }

    /** 학생 상세 정보 조회 **/
    public StudentDto retrieveStudentAccount(Long idx) throws BaseException{
        try{

            StudentDto studentDto = accountJpaRepository.findByIdx(idx);
            return studentDto;
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }

    }

    /** 학생 단건 조회 **/
    public GetStudentRes retrieveStudent(Long idx) throws BaseException{
        try{

            StudentDto studentDto = accountJpaRepository.findByIdx(idx);
            GetStudentRes getStudentRes = new GetStudentRes(studentDto.getIdx(), studentDto.getEmail(), studentDto.getName(), studentDto.getPhone(), studentDto.getStudentNo(), studentDto.getWarn());
            return getStudentRes;
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }

    }

    /** 학생 리스트로 모두 조회 **/
    public List<StudentRes> retrieveAllStudentAccount() throws BaseException{
        try{

              return accountJpaRepository.findAllBy();
        }catch (Exception exception){
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
