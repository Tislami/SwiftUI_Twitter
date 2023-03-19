//
//  AuthRepository.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation
import Firebase

protocol AuthRepository{
    
    // func createUser() async throws -> User
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func getUser(id: String,completion: @escaping (Result<User, Error>) -> Void)
    func getAuthState(completion: @escaping (Result<String?, Error>) -> Void)
}

    
class AuthRepositoryImpl : AuthRepository{
    let db = FirebaseDatabase()
    
    
    
    func listenForAuthChanges(completion: @escaping (Result<User, Error>) -> Void){
        db.auth.addStateDidChangeListener { auth, user in
            if let user = user {
                self.getUser(id: user.uid, completion: completion)
            } else {
                completion(.failure())
            }
        }
    }
    
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        db.auth.signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let uid = authResult?.user.uid else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user ID"])))
                return
            }
            
            self.getUser(id: uid, completion: completion)
        }
    }
    
    
    
    func getUser(id: String, completion: @escaping (Result<User, Error>) -> Void) {
        self.db.userCollection.document(id).getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = snapshot?.data() else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user data"])))
                return
            }
            
            let user = User(id: id, email: data["email"] as! String, name: (data["name"] as! String))
            completion(.success(user))
        }
    }
}
