//
//  LoginError.swift
//  Login App
//
//  Created by Mary Wynzel Muring on 8/19/25.
//

enum LoginError: Error {
    case invalidCredentials
    case empty
    case unknown
    
    var localizedDescription: String {
        switch self {
            
        case .invalidCredentials:
            return "Invalid username or password"
        case .empty:
            return "Username or password cannot be empty"
        case .unknown:
            return "Unknown error"
        }
    }
}
