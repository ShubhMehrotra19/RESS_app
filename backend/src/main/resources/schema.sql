CREATE TABLE Employees (
    employee_number INT PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email_id VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL
);

CREATE TABLE Family (
    employee_number INT,
    name VARCHAR(100) NOT NULL,
    relation VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    FOREIGN KEY (employee_number) REFERENCES Employees(employee_number)
);
