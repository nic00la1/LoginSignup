//
//  LoginView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

enum FocusedField {
    case email
    case password
}

import SwiftUI

struct LoginView: View {
    @State private var emailText = ""
    @State private var passwordText = ""
    
    @State private var isValidEmail = true
    @State private var isValidPassword = true
    
    var canProceed: Bool {
        Validator.validateEmail(emailText) && Validator.validatePassword(passwordText)
    }
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login here")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.primaryBlue)
                    .padding(.bottom)
                
                Text("Welcome back you've\n been missed!")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 80)
                
                EmailTextField(emailText: $emailText, isValidEmail: $isValidEmail)
                
                PasswordTextField(passwordText: $passwordText, isValidPassword: $isValidPassword, validatePassword: Validator.validatePassword, errorText: "Your password is not valid", placeholder: "Password")
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot your password?")
                            .foregroundStyle(.primaryBlue)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding(.trailing)
                    .padding()
                }
                
                Button {
                    
                } label: {
                    Text("Sign in")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.primaryBlue)
                .cornerRadius(12)
                .padding(.horizontal)
                .opacity(canProceed ? 1.0 : 0.5)
                .disabled(!canProceed)
                
                Button {
                    
                } label: {
                    Text("Create new account")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.gray)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                .padding(.horizontal)
                
                BottomView(googleAction: {}, facebookAction: {}, appleAction: {})
            }
        }
    }
}

#Preview {
    LoginView()
}
