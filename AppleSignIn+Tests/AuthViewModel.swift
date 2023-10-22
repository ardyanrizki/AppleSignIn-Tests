//
//  AuthViewModel.swift
//  AppleSignIn+Tests
//
//  Created by Muhammad Rizki Ardyan on 22/10/23.
//

import SwiftUI
import AuthenticationServices

class AuthViewModel: ObservableObject {
    
    @AppStorage("userId") var userId: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    func signInResultHandler(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            switch auth.credential {
            case let credential as ASAuthorizationAppleIDCredential:
                
                let userId = credential.user
                let email = credential.email
                let firstName = credential.fullName?.givenName
                let lastName = credential.fullName?.familyName
                
                self.userId = userId
                self.email = email ?? ""
                self.firstName = firstName ?? ""
                self.lastName = lastName ?? ""
                
            default:
                break
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func signOut() {
        self.userId = ""
        self.email = ""
        self.firstName = ""
        self.lastName = ""
    }
    
}
