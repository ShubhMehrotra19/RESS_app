package com.example.backend;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "Family")
public class Family {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "family_id")
    private Long familyId;

    @ManyToOne
    @JoinColumn(name = "employee_number", nullable = false)
    private Employee employee;

    private String name;

    @Column(length = 10)
    private String relation;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;
}
