//
//  AuthRepository.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation
import Firebase
import Combine


//protocol AuthRepository{
//
//    func createUser(email: String, password: String, name: String) -> AnyPublisher<User, Error>
//    func login(email: String, password: String, completion: @escaping (Result<User?, Error>) -> Void)
//    func getUser(id: String,completion: @escaping (Result<User?, Error>) -> Void)
//}

    
class AuthRepositoryImpl{
    let db = FirebaseDatabase()
    
    func getAuthState(completion: @escaping (String?) -> Void) {
        db.auth.addStateDidChangeListener { _ , user in
            if let user = user {
                completion(user.uid)
            } else {
                completion(nil)
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        db.auth.signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let uid = authResult?.user.uid else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user ID"])))
                return
            }
            completion(.success(uid))
        }
    }

    func signUp(email: String, password: String, name: String, completion: @escaping (Result<String, Error>) -> Void) {
        self.db.auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult.user.uid))
            }
        }
    }
    
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try db.auth.signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
}
