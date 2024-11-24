package com.example.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private EmployeeRepo employeeRepository;

    public boolean authenticate(String employeeNo, String password) {
        Optional<Employee> employee = employeeRepository.findByEmployeeNumber(Long.valueOf(employeeNo));
        return employee.isPresent() && employee.get().getPassword().equals(password); // Handling Optional properly
    }
}
