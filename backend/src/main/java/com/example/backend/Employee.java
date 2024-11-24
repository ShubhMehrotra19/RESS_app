package com.example.backend;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Data
@Table(name = "Employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_number")
    private Long employeeNumber;

    private String password;

    @Column(name = "mobile_number", length = 13)
    private String mobileNumber;

    @Column(name = "email_id", length = 100)
    private String emailId;

    @Column(length = 10)
    private String gender;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Family> familyMembers;
}
