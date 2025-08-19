//
//  LoginService.swift
//  Login App
//
//  Created by Mary Wynzel Muring on 8/18/25.
//

import Foundation

class LoginService {
    func login(loginCredential credential: LoginModel, completion: @escaping (Result<String, LoginError>) -> Void) {
        // To simulate the API call, I added a 2-second delay on this action
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // I added a sample validation of the credentials just to show the invalid credential error message
            // In this case, I just set that when entered "invalid" as username or password, it should return an invalid credential error
            if credential.username != "invalid" && credential.password != "invalid" {
                completion(.success(credential.username))
            } else {
                completion(.failure(LoginError.invalidCredentials))
            }
        }
    }
}
