//
//  SignInScreenView.swift
//  AppleSignIn+Tests
//
//  Created by Muhammad Rizki Ardyan on 22/10/23.
//

import SwiftUI
import AuthenticationServices

struct SignInScreenView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SignInWithAppleButton(.continue) { request in
                    
                    request.requestedScopes = [.email, .fullName]
                    
                } onCompletion: { result in
                    viewModel.signInResultHandler(result)
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                .cornerRadius(.infinity)
                .frame(height: 50)
                .padding()

            }
        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    SignInScreenView()
}
