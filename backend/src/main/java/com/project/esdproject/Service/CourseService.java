package com.project.esdproject.Service;


import com.project.esdproject.Repository.CourseRepository;
import com.project.esdproject.model.Courses;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;
    public boolean addCourse(Courses course){
        Courses crs = courseRepository.save(course);
        return crs.getCourse_code().equals(course.getCourse_code());
    }

//@Transactional is an annotation in Spring that ensures a method or class runs within a transaction, meaning any database operations will be committed or rolled back together based on the success or failure of the method.
    @Transactional
    public boolean addCoursesToId(Integer emp_id,Integer c_id){
        return courseRepository.updateEmployeeForCourse(emp_id, c_id) > 0;
    }


}
