class Employee {
  final int employeeNumber;
  final String password;
  final String emailId;
  final String gender;

  Employee({
    required this.employeeNumber,
    required this.password,
    required this.emailId,
    required this.gender,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeNumber: json['employeeNumber'],
      password: json['password'],
      emailId: json['emailId'],
      gender: json['gender'],
    );
  }
}
