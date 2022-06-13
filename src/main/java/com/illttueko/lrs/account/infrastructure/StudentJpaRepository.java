package com.illttueko.lrs.account.infrastructure;

import com.illttueko.lrs.account.domain.GetStudentDTO;
import com.illttueko.lrs.account.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentJpaRepository extends JpaRepository<Student, Long> {
    GetStudentDTO findByIdx(long idx);
}
