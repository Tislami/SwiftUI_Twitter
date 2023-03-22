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
        print("UserRepository getUser : getting \(id)")
        return Future<User, Error> { promise in
            self.db.userCollection.document(id).getDocument { (snapshot, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                guard let data = snapshot?.data() else {
                    print("UserRepository getUser : error Could not get user data")
                    promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user data"])))
                    return
                }
                let user = User(id: id, email: data["email"] as! String, name: data["name"] as! String)
                print("UserRepository getUser : success \(user)")
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func createUser(user: User) -> AnyPublisher<User, Error> {
        print("UserRepository createUser : creating \(user.id)")
        return Future<User, Error> { promise in
            self.db.userCollection.document(user.id).setData(
                ["email": user.email,
                 "id": user.id,
                 "name": user.name]
            ){error in
                if error == nil {
                    print("UserRepository getUser : success \(user)")
                    promise(.success(user))
                }
                else{
                    print("UserRepository getUser : error \(error!)")
                    promise(.failure(error!))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
//    func getAllUsers() -> AnyPublisher<[User], Error> {
//        return Future<[User], Error> { promise in
//            self.db.userCollection.getDocuments { snapshot, error in
//                if let error = error {
//                    promise(.failure(error))
//                    return
//                }
//                guard let documents = snapshot?.documents else {
//                    promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get users"])))
//                    return
//                }
//
//                let users = documents.compactMap { document -> User? in
//                                do {
//                                    let user = try document.data(as: User.self)
//                                    return user
//                                } catch {
//                                    print("Error decoding user: \(error.localizedDescription)")
//                                    return nil
//                                }
//                            }
//            }
//        }.eraseToAnyPublisher()
//    }
}
