//
//  AuthViewModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 16.03.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    private let repo: AuthRepositoryImpl = AuthRepositoryImpl()
    @Published var authState: AuthState = AuthState()

    init(){
        getAuthState()
        print("Auth ViewModel initialized")
    }
    
    func getAuthState(){
        repo.getAuthState { uid in
            if uid != nil{
                print("GetAuthState success \(uid!)")
                self.authState.id = uid
            }
        }
    }
    
    func signIn() {
        authState.isLoading = true
        repo.signIn(email: authState.email, password: authState.password) { result in
            self.authState.isLoading = false
            switch result {
            case .success(let uid):
                print("Completion success \(uid)")
                self.authState.id = uid
            case .failure(let error):
                print("Completion failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
    
    
    func signUp(){
        authState.isLoading = true
        repo.signUp(email: authState.email, password: authState.password, name: authState.fullName){ result in
            self.authState.isLoading = false
            switch result {
            case .success(let uid):
                print("Completion success \(uid)")
                self.authState.id = uid
            case .failure(let error):
                print("Completion failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signOut(){
        self.authState.isLoading = true
        repo.signOut { result in
            self.authState.isLoading = false
            switch result {
            case .success:
                print("Completion success singout")
                self.authState.id = nil
            case .failure(let error):
                print("Completion failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
}
