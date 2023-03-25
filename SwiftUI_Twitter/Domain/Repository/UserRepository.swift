//
//  UserRepository.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation
import Firebase
import Combine

final class UserRepository : ObservableObject{
    private let db = FirebaseDatabase()

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
                    promise(.failure(NSError(
                        domain: "",
                        code: 0,
                        userInfo: [NSLocalizedDescriptionKey: "Could not get user data"]))
                    )
                    return
                }
                let user =  self.convertToUser(document:data)
                
                print("UserRepository getUser : success \(user)")
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func createUser(user: User) -> AnyPublisher<User, Error> {
        print("UserRepository createUser : creating \(user.id)")
        return Future<User, Error> { promise in
            self.db.userCollection.document(user.id).setData(self.convertFromUser(user: user)){error in
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
    
    func getUserByName(query: String) -> AnyPublisher<[User], Error> {
        print("UserRepository getAllUsers: getting users")
        return Future<[User], Error> { promise in
            self.db.userCollection.getDocuments { snapshot, error in
                if let error = error {
                    promise(.failure(error))
                    print("UserRepository getAllUsers: error \(error)")
                    return
                }
                guard let documents = snapshot?.documents else {
                    print("UserRepository getAllUsers: error Could not get users")
                    promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get users"])))
                    return
                }
                
                let users = documents.compactMap { document in
                    if (document["name"] as! String).contains(query){
                        return self.convertToUser(document:document)
                    }else {
                        return nil
                    }
                }
                
                promise(.success(users))
                print("UserRepository getAllUsers: success \(users.count)")
            }
        }.eraseToAnyPublisher()
    }
    
    
    func folluwUser(userId: String, completion: @escaping (Error?) -> Void) {
        print("UserRepository folluwUser: starting \(userId)")
        self.db.userCollection.document(userId)
            .updateData( ["followers" : FieldValue.arrayUnion([userId])]){ error in
            if let error = error {
                completion(error)
                print("UserRepository folluwUser: error \(error)")
                return
            }
            print("UserRepository folluwUser: success")
        }
    }
}





extension UserRepository {
    func convertToUser(document: DocumentSnapshot) -> User{
        return User(
            id: document["id"] as! String,
            email: document["email"] as! String,
            name: document["name"] as! String,
            nickName: document["nickname"] as! String,
            following: document["following"] as! [String],
            followers: document["followers"] as! [String]
        )
    }
    
    func convertToUser(document: [String: Any]) -> User{
        return User(
            id: document["id"] as! String,
            email: document["email"] as! String,
            name: document["name"] as! String,
            nickName: document["nickname"] as! String,
            following: document["following"] as! [String],
            followers: document["followers"] as! [String]
        )
    }
    
    func convertFromUser(user: User) -> [String: Any]{
        return [
            "id" : user.id,
            "email" : user.email,
            "name" : user.name,
            "nickname" : user.nickName,
            "following" : user.followers,
            "followers" : user.following,
        ]
    }
}
