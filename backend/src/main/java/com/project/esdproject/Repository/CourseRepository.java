package com.project.esdproject.Repository;

import com.project.esdproject.model.Courses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<Courses, Integer> {

    @Modifying
    // Course repository is used to update the course employee id.
    //
    @Query("update Courses c set c.employee_id.employee_id = :employeeId where c.course_id = :courseId")
    int updateEmployeeForCourse(Integer employeeId, Integer courseId);

}
