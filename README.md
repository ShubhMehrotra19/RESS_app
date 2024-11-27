# Railway Employee Self Service App 🚉

A **Flutter** application designed to streamline employee login for the Railway Employee Self Service portal. The app integrates with a **Spring Boot backend** to authenticate users and provide a seamless user experience.

---

## 📜 Features
- **User Authentication**: Employees can log in securely using their Employee Number and Password.
- **Dynamic UI**: A responsive and intuitive user interface built with Flutter.
- **Error Handling**: Displays meaningful error messages for invalid credentials or server issues.
- **REST API Integration**: Connects to a Spring Boot backend for user authentication.
- **Custom Branding**: Includes Indian Railway and Azadi Ka Amrit Mahotsav logos.

---

## 🚀 Technologies Used

### **Frontend**: Flutter
- State Management: StatelessWidget
- HTTP Requests: `http` package
- UI Framework: Material Design

### **Backend**: Spring Boot
- REST API for authentication
- Dependency Injection with `@Autowired`
- Response handling with `ResponseEntity`

---

## 🌟 App Flow

1. **Login Screen**:  
   Users are prompted to enter their Employee Number and Password.

2. **Backend Authentication**:
   - Sends a POST request to the endpoint:  
     `http://<server-ip>:8080/api/v1/auth/login`
   - Payload:
     ```json
     {
       "employee_number": "<EMPLOYEE_NUMBER>",
       "password": "<PASSWORD>"
     }
     ```

3. **Validation**:  
   - If the login is successful (`200 OK`), the user is redirected to the **Home** screen.
   - If invalid credentials are provided, an error message is displayed.

4. **Error Handling**:
   - Handles network errors, timeout issues, and invalid responses gracefully.

---

## 🔧 Setup Instructions

### Prerequisites
- **Flutter**: Installed and configured.  
  [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Spring Boot**: Running backend server.  
  [Installation Guide](https://spring.io/guides/gs/spring-boot/)
- **Android Studio/VS Code**: Recommended IDE for Flutter development.

---


