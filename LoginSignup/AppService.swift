//
//  AppService.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import Appwrite

enum RequestStatus {
    case success
    case error(_ message: String)
}

class AppService {
    
    let client = Client()
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("65c7af34a140cec30607")
        .setSelfSigned(true)
    
    let account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    func createUser(email: String, password: String) async throws -> RequestStatus {
        do {
            _ = try await account.create(userId: ID.unique(), email: email, password: password)
            return .success
            
        } catch {
            return .error(error.localizedDescription)
        }
    }
}
