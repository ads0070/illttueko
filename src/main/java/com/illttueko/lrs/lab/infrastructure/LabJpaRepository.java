package com.illttueko.lrs.lab.infrastructure;

import com.illttueko.lrs.lab.domain.GetLabDTO;
import com.illttueko.lrs.lab.domain.Lab;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LabJpaRepository extends JpaRepository<Lab, Long> {
    GetLabDTO findByClassNo(int classNo);
}
