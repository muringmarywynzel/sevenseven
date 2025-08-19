//
//  LoginViewModel.swift
//  Login App
//
//  Created by Mary Wynzel Muring on 8/18/25.
//

import Foundation

class LoginViewModel {
    private let service = LoginService()
    var loggedInUser: String?
    
    func login(loginCredential credential: LoginModel, completion: @escaping (Result<String, LoginError>) -> Void) {
        service.login(loginCredential: credential, completion: completion)
    }
}
