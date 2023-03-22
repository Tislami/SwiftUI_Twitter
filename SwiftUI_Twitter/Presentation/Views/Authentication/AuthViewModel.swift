//
//  AuthViewModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 16.03.2023.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    private let authRepo: AuthRepositoryImpl = AuthRepositoryImpl()
    private let userRepo: UserRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var authState: AuthState = AuthState()

    init(){
        print("AuthViewModel initialized")
        getAuthState()
    }
    
    func getAuthState(){
        print("AuthViewModel getAuthState : getting")
        authRepo.getAuthState { uid in
            if uid != nil{
                print("AuthViewModel getAuthState : success \(uid!)")
                self.authState.uid = uid
                self.authState.authStatus = .Logged
            }
        }
    }
    
    func signIn() {
        print("AuthViewModel singIn : siging In")
        authState.isLoading = true
        authRepo.signIn(email: authState.email, password: authState.password) { result in
            self.authState.isLoading = false
            switch result {
            case .success(let uid):
                print("AuthViewModel singIn : success \(uid)")
                self.authState.uid = uid
                self.authState.authStatus = .Logged
            case .failure(let error):
                print("AuthViewModel singIn : failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signUp(){
        print("AuthViewModel singUp : siging up")
        authState.isLoading = true
        authRepo.signUp(email: authState.email, password: authState.password, name: authState.fullName){ result in
            self.authState.isLoading = false
            switch result {
            case .success(let uid):
                print("AuthViewModel singUp : success \(uid)")
                self.authState.uid = uid
                self.authState.authStatus = .Registered
            case .failure(let error):
                print("AuthViewModel singUp : failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signOut(){
        print("AuthViewModel singOut : siging out")
        self.authState.isLoading = true
        authRepo.signOut { result in
            self.authState.isLoading = false
            switch result {
            case .success:
                print("AuthViewModel signOut : success")
                self.authState.uid = nil
                self.authState.presentAlert = false
            case .failure(let error):
                print("AuthViewModel signOut : failure \(error)")
                self.authState.presentAlert = true
                self.authState.errorMessage = error.localizedDescription
            }
        }
    }
}
