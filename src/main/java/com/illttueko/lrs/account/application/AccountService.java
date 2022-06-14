package com.illttueko.lrs.account.application;

import com.illttueko.config.BaseException;
import com.illttueko.lrs.account.domain.*;
import com.illttueko.lrs.account.infrastructure.AccountJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import static com.illttueko.config.BaseResponseStatus.DATABASE_ERROR;
import static com.illttueko.lrs.account.domain.Student.dtoToEntity;

@Service
public class AccountService {

    private final AccountJpaRepository accountJpaRepository;
    private final AccountProvider accountProvider;

    @Autowired
    public AccountService(AccountJpaRepository accountJpaRepository, AccountProvider accountProvider) {
        this.accountJpaRepository = accountJpaRepository;
        this.accountProvider = accountProvider;
    }

    /** 학생 생성 **/
    public String createStudentAccount(CreateStudentDto createStudentDto) throws BaseException {
        try {

            if (accountJpaRepository.findByStudentNo(createStudentDto.getStudentNO()) == null) {
                accountJpaRepository.save(createStudentDto.toEntity());
                return "정상 등록되었습니다.";
            }
            return "이미 등록된 학생정보가 있습니다.";
        } catch (Exception exception) {

            throw new BaseException(DATABASE_ERROR);
        }
    }

    /** 학생 수정 **/
    public String updateStudentAccount(UpdateStudentDto dto) throws BaseException{
        StudentDto studentDto = accountProvider.retrieveStudentAccount(dto.getIdx());
        try{
            if(studentDto == null){
                return "등록된 정보를 가진 학생이 없습니다.";
            }
            PatchStudentDto patchStudentDto = new PatchStudentDto(studentDto.getIdx(), studentDto.getEmail(), dto.getName(), studentDto.getPassword(), studentDto.getPhone(), dto.getStudentNo(), dto.getWarn());

            if(dto.getStudentNo() == 0) {
                patchStudentDto.setStudentNo(studentDto.getStudentNo());
            }
            if(dto.getName() == null) {
                patchStudentDto.setName(studentDto.getName());
            }
            if(dto.getWarn() == 0) {
                patchStudentDto.setWarn(studentDto.getWarn());
            }

            Student student = dtoToEntity(patchStudentDto);
            accountJpaRepository.save(student);
            return "수정되었습니다.";

        }catch (Exception exception){
            exception.getStackTrace();
            throw new BaseException(DATABASE_ERROR);
        }
    }

    /** 학생 삭제 **/
    public String deleteStudentAccount(long idx) throws BaseException{
        try{
            StudentDto studentDto  = accountProvider.retrieveStudentAccount(idx);
            if(studentDto == null){
                return "없는 학생입니다.";
            }
            accountJpaRepository.deleteById(idx);
            return "삭제 완료되었습니다.";

        }catch (Exception exception){
            exception.getStackTrace();
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
