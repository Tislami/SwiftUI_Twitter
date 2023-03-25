//
//  AuthState.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 16.03.2023.
//

import Foundation

struct AuthState {
    var uid: String? = "hQ2koqCHwnYVGRwNEwrX0kRUk6x1"
    var email: String = "deneme@gmail.com"
    var fullName: String = "Deneme"
    var password: String = ""
    var errorMessage: String = ""
    var presentAlert: Bool = false
    var isLoading: Bool = false
    var authStatus : AuthStatus = .Logged
}


enum AuthStatus {
    case Logged
    case Registered
}



