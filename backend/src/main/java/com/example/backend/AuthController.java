package com.example.backend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class AuthController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Map<String, String> payload) {
        String employeeNumber = payload.get("employee_number");
        String password = payload.get("password");

        if (employeeNumber == null || password == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Employee number or password is missing.");
        }

        boolean isAuthenticated = userService.authenticate(employeeNumber, password);
        if (isAuthenticated) {
            return ResponseEntity.ok("Login Successful");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid Credentials");
        }
    }
}
