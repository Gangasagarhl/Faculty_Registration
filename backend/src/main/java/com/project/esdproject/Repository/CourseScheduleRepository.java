package com.project.esdproject.Repository;

import com.project.esdproject.model.CourseSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface CourseScheduleRepository extends JpaRepository<CourseSchedule, Integer> {

    //@Query(value  = "select cs from CourseSchedule cs where cs.course_id.course_id in (select c.course_id from Courses c where c.employee_id.employee_id is null) and (cs.day, cs.time) not in (select cs2.day, cs2.time from CourseSchedule cs2 where cs2.course_id.course_id in (select co.course_id from Courses co where co.employee_id.employee_id = id))")
    /*@Query(value = "SELECT cs FROM CourseSchedule cs " +
            "WHERE cs.course_id.course_id IN (" +
            "    SELECT c.course_id FROM Courses c WHERE c.employee_id IS NULL" +
            ") " +
            "AND (cs.day, cs.time) NOT IN (" +
            "    SELECT cs2.day, cs2.time FROM CourseSchedule cs2 " +
            "    JOIN Courses co2 ON cs2.course_id = co2.course_id " +
            "    WHERE co2.employee_id.employee_id =:id" +  // Employee ID parameter
            ") " +
            "AND NOT EXISTS (" +
            "    SELECT 1 FROM CourseSchedule cs3 " +
            "    JOIN Courses co3 ON cs3.course_id.course = co3.course_id " +
            "    WHERE cs3.day = cs.day " +
            "    AND cs3.time = cs.time " +
            "    AND co3.employee_id.employee_id <> :id" +  // Employee ID parameter for conflict
            ")")*/

    @Query(value = "SELECT cs.* " +
            "FROM course_schedule cs " +
            "WHERE cs.course_id IN (" +
            "    SELECT c.course_id " +
            "    FROM courses c " +
            "    WHERE c.employee_id IS NULL " +
            ") " +
            "AND (cs.course_day, cs.course_time) NOT IN (" +
            "    SELECT cs2.course_day, cs2.course_time " +
            "    FROM course_schedule cs2 " +
            "    JOIN courses co2 ON cs2.course_id = co2.course_id " +
            "    WHERE co2.employee_id = :id " +  // Employee ID parameter
            ") " +
            "AND NOT EXISTS (" +
            "    SELECT 1 FROM course_schedule cs3 " +
            "    JOIN courses co3 ON cs3.course_id = co3.course_id " +
            "    WHERE cs3.course_day = cs.course_day " +
            "    AND cs3.course_time = cs.course_time " +
            "    AND co3.employee_id <> :id" +  // Employee ID for conflict check
            ")", nativeQuery = true)

    List<CourseSchedule> getcourseScheduleList(Integer id);

}
