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
                    .padding(.bottom)
                
                TextField("Email", text: $emailText)
                    .focused($focusedField, equals: .email)
                    .padding()
                    .background(.secondaryBlue)
                    .cornerRadius(12)
                    .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.primaryBlue, lineWidth: 3)
                    )
                    .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
