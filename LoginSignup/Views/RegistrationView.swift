//
//  RegistrationView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var confirmPasswordText = ""
    @State private var isValidEmail = true
    @State private var isValidPassword = true
    @State private var isConfirmPasswordValid = true
    
    @State private var showSheet = false
    
    var canProceed: Bool {
        Validator.validateEmail(emailText) && Validator.validatePassword(passwordText) &&
        validateConfirm(confirmPasswordText)
    }
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                
                VStack {
                    Text("Create Account")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.primaryBlue)
                        .padding(.bottom)
                        .padding(.top, 48)
                    
                    Text("Create an account so you can explore all the\n existing jobs")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 80)
                    
                    EmailTextField(emailText: $emailText, isValidEmail: $isValidEmail)
                    
                    PasswordTextField(passwordText: $passwordText, isValidPassword: $isValidPassword, validatePassword: Validator.validatePassword, errorText: "Your password is not valid", placeholder: "Password")
                    
                    PasswordTextField(passwordText: $confirmPasswordText, isValidPassword: $isConfirmPasswordValid,  validatePassword: validateConfirm,errorText: "Your password is not matching", placeholder: "Confirm password")
                        .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try? await viewModel.createUser(email: emailText, password: passwordText)
                        }
                    } label: {
                        Text("Sign up")
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
                        showSheet.toggle()
                    } label: {
                        Text("Already have an account")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    BottomView(googleAction: {}, facebookAction: {}, appleAction: {})
                    
                    Spacer()
                }
                .opacity(viewModel.isLoading ? 0.5 : 1.0)
            }
            .navigationBarBackButtonHidden(true)
        }
        .alert(viewModel.hasError ? "Error" : "Success", isPresented: $viewModel.showAlert) {
            if viewModel.hasError {
                Button("Try Again") {}
            } else {
                Button("Ok") {
                    dismiss()
                }
            }
        } message: {
            Text(viewModel.alertMessage)
        }
        .sheet(isPresented: $showSheet) {
            LoginView()
        }
    }
    
    func validateConfirm(_ password: String) -> Bool {
        passwordText == password
    }
}

#Preview {
    RegistrationView()
}
