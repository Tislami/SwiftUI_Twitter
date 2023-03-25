//
//  UserViewModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 20.03.2023.
//

import Combine
import Foundation

class UserViewModel: ObservableObject {
    private let repo: UserRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userState: UserState = UserState()
    
    init(){
        print("UserViewModel initialized")
    }
    
    func getUser(id: String){
        print("UserViewModel getUser : getting user \(id)")
        repo.getUser(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print("UserViewModel getUser : failure \(error)")
                        self.userState.presentAlert = true
                        self.userState.errorMessage = error.localizedDescription
                    case .finished:
                        print("UserViewModel getUser : finished.")
                        self.userState.isLoading = false
                    }
                },
                receiveValue: { user in
                    print("UserViewModel getUser : success \(user)")
                    self.userState.user = user
                }
            ).store(in: &cancellables)
    }
    
    
    func createUser(user: User){
        userState.isLoading = true
        print("UserViewModel CreasteUser creating \(user).")
        repo.createUser(user: user)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.userState.isLoading = false
                    switch completion {
                    case .failure(let error):
                        print("UserViewModel CreateUser : failure \(error)")
                        self.userState.presentAlert = true
                        self.userState.errorMessage = error.localizedDescription
                    case .finished:
                        print("UserViewModel CreasteUser : finished.")
                        self.userState.isLoading = false
                    }
                },
                receiveValue: { user in
                    print("UserViewModel CreateUser : success \(user)")
                    self.userState.user = user
                }
            ).store(in: &cancellables)
    }
    
    func followUser(userId: String) {
        userState.isLoading = true
        print("UserViewModel followUser: starting")
        repo.folluwUser(userId: userId) { error in
            self.userState.isLoading = false
            if error != nil{
                self.userState.presentAlert = true
                self.userState.errorMessage = error!.localizedDescription
                print("UserViewModel followUser: error \(error!)")
            }
            print("UserViewModel followUser: success")
        }
    }
    
    func isFollowing(uid: String){
        
    }
    
    func closeUser(){
        userState.user = nil
    }
    
}

