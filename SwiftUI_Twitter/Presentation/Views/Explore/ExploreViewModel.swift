//
//  ExploreViewModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 12.03.2023.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject {
    private let repo : UserRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    @Published var exploreState: ExploreState = ExploreState()
    
    init(){
        print("ExploreViewModel initialized")
    }
    
    func getUserByName(query: String){
        exploreState.isLoading = true
        repo.getUserByName(query: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.exploreState.isLoading = false
                    switch completion {
                    case .failure(let error):
                        print("UserViewModel getUser : failure \(error)")
                        self.exploreState.presentAlert = true
                        self.exploreState.errorMessage = error.localizedDescription
                    case .finished:
                        print("UserViewModel getUser : finished.")
                        self.exploreState.isLoading = false
                    }
                },
                receiveValue: { users in
                    print("UserViewModel getUser : success \(users)")
                    self.exploreState.users = users
                }
            ).store(in: &cancellables)
    }
    
    
}
