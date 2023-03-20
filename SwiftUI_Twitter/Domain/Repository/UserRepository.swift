//
//  UserRepository.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation
import Combine

final class UserRepository : ObservableObject{
    let db = FirebaseDatabase()

    func getUser(id: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            self.db.userCollection.document(id).getDocument { (snapshot, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                guard let data = snapshot?.data() else {
                    promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user data"])))
                    return
                }
                let user = User(id: id, email: data["email"] as! String, name: (data["name"] as! String))
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
