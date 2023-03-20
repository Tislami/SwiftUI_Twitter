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
        print("Auth ViewModel initialized")

    }
    
    func getUser(id: String){
        repo.getUser(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print("AnyPublisher failure \(error)")
                        self.userState.presentAlert = true
                        self.userState.errorMessage = error.localizedDescription
                    case .finished:
                        print("AnyPublisher finished.")
                        self.userState.isLoading = false
                    }
                },
                receiveValue: { user in
                    print("AnyPublisher success \(user)")
                    self.userState.user = user
                }
            ).store(in: &cancellables)
    }
    
    
}

