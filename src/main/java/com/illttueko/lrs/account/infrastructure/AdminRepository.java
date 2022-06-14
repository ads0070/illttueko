package com.illttueko.lrs.account.infrastructure;

import com.illttueko.lrs.account.domain.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Optional;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
    Optional<Admin> findByAdminIdAndPassword(String adminId, String password);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(nativeQuery = true, value = "UPDATE admin SET password=:password WHERE admin_id=:adminId")
    int updateUserInfo(@Param("password")String password, @Param("adminId")String adminId);
}
