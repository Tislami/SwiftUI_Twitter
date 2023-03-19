//
//  AuthViewModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 16.03.2023.
//

import Foundation


class AuthViewModel: ObservableObject {
    private let repo: AuthRepository = AuthRepositoryImpl()

    @Published var authState: AuthState = AuthState()
    
    func signIn() {
        print("VM clicked")
        authState.isLoading = true
        repo.login(email: authState.email, password: authState.password) { result in
            self.authState.isLoading = false
            switch result {
            case .success(let user):
                self.authState.user = user
                print("VM success : \(self.authState.user)")

            case .failure(let error):
                print("VM error : \(error.localizedDescription)")
                self.authState.presentAlert = true

                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
}
