//
//  ContentView.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

struct ContentView: View {
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
                        // action
                    } label: {
                        Text("Login")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 160, height: 60)
                    .background(.primaryBlue)
                    .cornerRadius(12)
                    
                    Button {
                        // action
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
        }
    }
}

#Preview {
    ContentView()
}
