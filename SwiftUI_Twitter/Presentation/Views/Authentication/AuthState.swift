//
//  AuthState.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 16.03.2023.
//

import Foundation

struct AuthState {
    var user: User?
    var email: String = ""
    var fullName: String = ""
    var password: String = ""
    var errorMessage: String = ""
    var presentAlert: Bool = false
    var isLogged: Bool = false
    var isLoading: Bool = false
}
