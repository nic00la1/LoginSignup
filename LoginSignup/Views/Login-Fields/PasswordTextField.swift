//
//  PasswordTextField.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var passwordText: String
    @Binding var isValidPassword: Bool
    
    @FocusState var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            SecureField("Password", text: $passwordText)
                .focused($focusedField, equals: .password)
                .padding()
                .background(.secondaryBlue)
                .cornerRadius(12)
                .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(!isValidPassword ? .red : focusedField == .password ? .primaryBlue : .white , lineWidth: 3)
                )
                .padding(.horizontal)
                .onChange(of: passwordText) { newValue in
                    isValidPassword = Validator.validatePassword(newValue)
                }
            if !isValidPassword {
                HStack {
                    Text("Your password is not valid!")
                        .foregroundStyle(.red)
                        .padding(.leading)
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    PasswordTextField(passwordText: .constant(""), isValidPassword: .constant(true))
}
