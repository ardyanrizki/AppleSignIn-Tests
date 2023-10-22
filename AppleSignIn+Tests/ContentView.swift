//
//  ContentView.swift
//  AppleSignIn+Tests
//
//  Created by Muhammad Rizki Ardyan on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.userId.isEmpty {
                SignInScreenView()
                    .environmentObject(viewModel)
            } else {
                HomeScreenView()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
