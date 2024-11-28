package com.project.esdproject.controller;

import com.project.esdproject.Service.CourseScheduleService;
import com.project.esdproject.Service.CourseService;
import com.project.esdproject.model.CourseSchedule;
import com.project.esdproject.model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.net.URISyntaxException;
import java.util.List;


@RestController
@RequestMapping(path = "/course")
public class CourseController {


    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseScheduleService courseScheduleService;
/*
@Component is a Spring annotation used to mark a class as a Spring-managed bean,
enabling it to be automatically detected and registered during classpath scanning.
It is typically used to define beans for business logic, services, or data access layers that need to be managed by the Spring container.
This allows for easier dependency injection, promotes loose coupling, and simplifies the configuration of the application.
It is commonly used for general-purpose components, and specialized annotations like @Service, @Repository, and @Controller are derived from it for specific use cases.
* */

    /*
    *This takes the data from backend.
    *
    * */
    // Working
   @PostMapping("/add")
    public ResponseEntity<String> addCourse(@RequestBody Courses course) throws URISyntaxException {
       System.out.println("\nInside the post mapping of course add: with the emp id as : ");
       boolean val = courseService.addCourse(course); //in service
        if (val)
            return new ResponseEntity<>("Success", HttpStatus.OK);
        else
            return new ResponseEntity<>("Failure while adding course", HttpStatus.NOT_FOUND);
    }




    //working
    @GetMapping("/{emp_id}/add/{course_id}")
    public ResponseEntity<List<CourseSchedule>> addCourses(@PathVariable("emp_id") Integer id,@PathVariable("course_id") Integer course_id) {

        System.out.println("\nInside the get mapping of curse controller: with the emp id as : "+ id+ "course id as this : "+course_id);
        boolean val  = courseService.addCoursesToId(id,course_id);
        List<CourseSchedule> courseScheduleList = courseScheduleService.getCourseSchedule(id);
        if (val)
            return new ResponseEntity<>(courseScheduleList, HttpStatus.OK);
        else
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
            //Send "Failure while adding employeeID to course" after checking frontend
    }


}
