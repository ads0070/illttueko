package com.illttueko.lrs.account.infrastructure;

import com.illttueko.lrs.account.domain.PatchStudentDto;
import com.illttueko.lrs.account.domain.Student;
import com.illttueko.lrs.account.domain.StudentDto;
import com.illttueko.lrs.account.domain.StudentRes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountJpaRepository extends JpaRepository<Student, Long> {
    StudentDto findByIdx(long idx);
    List<StudentRes> findAllBy();

    PatchStudentDto findByStudentNo(int studentId);

}
