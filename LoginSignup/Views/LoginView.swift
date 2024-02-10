//
//  LoginView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

struct LoginView: View {
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
                
            }
        }
    }
}

#Preview {
    LoginView()
}
