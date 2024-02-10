//
//  AppService.swift
//  LoginSignup
//
//  Created by Nicola Kaleta on 10/02/2024.
//

import Appwrite

class AppService {
    
    let client = Client()
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("65c7af34a140cec30607")
        .setSelfSigned(true)
    
    let account: Account
    
    init(account: Account) {
        self.account = account
    }
}
