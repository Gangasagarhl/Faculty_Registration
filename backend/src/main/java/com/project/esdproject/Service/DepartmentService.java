package com.project.esdproject.Service;

import com.project.esdproject.model.Department;
import com.project.esdproject.Repository.DepartmentRepository; // Assuming DepartmentDAO is replaced with Spring Data JPA Repository
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    //private static final Logger logger = LoggerFactory.getLogger(DepartmentService.class);
/*
* logger.error("Error in DepartmentService", e);:
Purpose: If an exception occurs while saving a department to the database (via departmentRepository.save(department)), the exception is logged using the logger.error method.
What it does:
It logs the error message "Error in DepartmentService", along with the details of the exception e (which could include the stack trace). This helps to quickly identify issues, such as database connectivity problems, or unexpected behavior in the code when adding a department.
Importance:
Logs like this are essential for diagnosing problems in production environments. Without logging, you would not know what went wrong or where the error occurred, making debugging difficult.
Logging the exception (with e) provides detailed stack traces that are valuable for developers to understand the root cause of issues.
* */
    @Autowired
    private DepartmentRepository departmentRepository;

    //
    public boolean addDepartment(Department department) {
        try {
            departmentRepository.save(department);
            // This is used to save the rep
            return true;
        } catch (Exception e) {
            //logger.error("Error in DepartmentService", e);
            return false;
        }
    }

    // this returns all the departments in the department table.
    public List<Department> getDepartmentList() {
        return departmentRepository.findAll();
    }

    // If you have a login method in your DepartmentRepository, uncomment this.
    /*
    public Department login(Department dept) {
        return departmentRepository.login(dept);
    }
    */
}
