//
//  LoginSignupApp.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import SwiftUI

@main
struct LoginSignupApp: App {
    @StateObject private var viewModel = ViewModel(service: AppService())
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
        }
    }
}
