//
//  HomeScreenView.swift
//  AppleSignIn+Tests
//
//  Created by Muhammad Rizki Ardyan on 22/10/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            if !viewModel.firstName.isEmpty {
                VStack {
                    Text("Hello, \(viewModel.firstName)")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text(viewModel.email)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Button("Sign Out") {
                viewModel.signOut()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    HomeScreenView()
        .environmentObject(AuthViewModel())
}
