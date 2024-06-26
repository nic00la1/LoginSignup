//
//  LoggedView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 11/02/2024.
//

import SwiftUI

struct LoggedView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                VStack {
                    Text("You are logged in!")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.vertical)
                    
                    Button {
                        Task {
                            try? await viewModel.logout()
                            dismiss()
                        }
                    } label: {
                        Text("Logout")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.primaryBlue)
                    .cornerRadius(12)
                    .padding()
                }
                .opacity(viewModel.isLoading ? 0.5 : 1.0)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

