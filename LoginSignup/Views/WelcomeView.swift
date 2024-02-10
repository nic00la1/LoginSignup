//
//  ContentView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

enum ViewStack {
    case login
    case registration
}

struct WelcomeView: View {
    @State private var presentNextView = false
    @State private var nextView: ViewStack = .login
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("work-from-home")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 370)
                    .padding(.top, 24)
                Spacer()
                
                Text("Discover Your Dream Job Here.")
                    .font(.system(size: 35, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.primaryBlue)
                    .padding(.bottom, 8)
                
                Text("Explore all the existing job roles based on your interest and study major")
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                
                Spacer()
                
                HStack(spacing: 12) {
                    
                    Button {
                        nextView = .login
                        presentNextView.toggle()
                    } label: {
                        Text("Login")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 160, height: 60)
                    .background(.primaryBlue)
                    .cornerRadius(12)
                    
                    Button {
                        nextView = .registration
                        presentNextView.toggle()
                    } label: {
                        Text("Register")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 160, height: 60)
                    
                    
                }
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $presentNextView) {
                switch nextView {
                case .login:
                    LoginView()
                case .registration:
                    RegistrationView()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
