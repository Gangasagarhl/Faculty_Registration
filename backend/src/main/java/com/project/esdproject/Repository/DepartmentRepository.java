package com.project.esdproject.Repository;

import com.project.esdproject.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {
    // JpaRepository provides the save() method, so no need to define it.
    // only the thing to executed using query etc etc is used here nothing other than this.
    //
}
