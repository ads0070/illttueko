package com.illttueko.lrs.account.infrastructure;

import com.illttueko.lrs.account.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;


@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    Optional<Student> findByStudentNoAndPassword(@Param("studentNo") int studentNo, @Param("password") String password);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(nativeQuery = true, value = "UPDATE student SET password=:password, phone=:phone, email=:email WHERE student_no=:studentNo")
    int updateUserInfoAll(@Param("password")String password, @Param("phone")String phone, @Param("email")String email, @Param("studentNo")int studentNo);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(nativeQuery = true, value = "UPDATE student SET phone=:phone, email=:email WHERE student_no=:studentNo")
    int updateUserInfo(@Param("phone")String phone, @Param("email")String email, @Param("studentNo")int studentNo);
}
