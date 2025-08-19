# sevenseven
Frontend iOS Coding Exam from Seven Seven Global Services - Create a Login application

FrontEnd iOS Coding Exam:

1. Create a Login application using Swift or Swift Ui. (No need to use API).
   - create a login page with login button and textbox for username and password.
   - once a logged in redirect to another view displaying “Welcome”
   - simulate the process as if you are connected to the API
3. MVVM Design pattern is a plus
4. UI responsive is a plus
5. Upload your code in Github and share the link

# iOS Login Application - Notes on what I've implemented on the application

The project is built using **Swift** and **Interface Builder (UIKit)**.

---

## Features Implemented

- **UI/UX**
  - Designed a simple and pleasing UI (using a reference found online).
  - Used **Interface Builder** to build the layout.
  - Made the UI **responsive** across different screen sizes, including iPads and landscape orientations.
 
    
 
    <img width="320" height="696" alt="login screen" src="https://github.com/user-attachments/assets/4d86d5fd-403e-42f1-8df4-d42fc1501313" />




- **Login Validation**
  - Added a validation check to ensure username and password are not empty.
  - Implemented sample credential validation (just to show the invalid credential error):
    - If either the username or password is `"invalid"`, the app shows an *Invalid Credential* error message, the app will accept any input otherwise.

- **API Simulation**
  - Simulated an API call by adding a **2-second delay**.
  - Implemented a `LoginService` to separate business logic from UI/ViewModel.
  - Added an **error closure** to simulate failed API requests.
  - Added a sample usage of passing a data from the API call, in this case, I passed the `username` (assuming it comes from the API request response).

- **Architecture & Structure**
  - Created a `LoginModel` model to structure login data.
  - Created a `LoginService` class to handle simulated API integration.
  - Defined an **enum** for `LoginError` with two cases (e.g., invalid credentials, empty credentials) and a default unknown error.

- **Additional Enhancements**
  - Added a **tap gesture recognizer** on the Login screen to dismiss the keyboard when tapping outside text fields.
  - Added a **tap gesture recognizer** on the Welcome screen to return to the Login page (for easier testing of multiple cases).

---

## Notes
- While the instructions only asked for a login flow, I extended the implementation with additional validations, error handling, gesture recognizers, and structured code to better demonstrate my approach to real-world development practices.

---
