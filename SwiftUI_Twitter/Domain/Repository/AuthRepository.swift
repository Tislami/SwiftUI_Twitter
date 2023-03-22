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
        print("AuthRepository getAuthState : getting")
        db.auth.addStateDidChangeListener { _ , user in
            if let user = user {
                print("AuthRepository getAuthState : success  \(user.uid)")
                completion(user.uid)
            } else {
                print("AuthRepository getAuthState : success Nill")
                completion(nil)
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        print("AuthRepository signIn : singing In")
        db.auth.signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("AuthRepository signIn : error \(error)")
                completion(.failure(error))
                return
            }
            guard let uid = authResult?.user.uid else {
                print("AuthRepository signIn : error Could not get user ID")
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not get user ID"])))
                return
            }
            
            print("AuthRepository signIn : success \(uid)")
            completion(.success(uid))
        }
    }

    func signUp(email: String, password: String, name: String, completion: @escaping (Result<String, Error>) -> Void) {
        print("AuthRepository signUp : singing Up")
        self.db.auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("AuthRepository signUp : error \(error)")
                completion(.failure(error))
            } else if let authResult = authResult {
                print("AuthRepository signUp : success \(authResult.user.uid)")
                completion(.success(authResult.user.uid))
            }
        }
    }
    
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        print("AuthRepository signOut : singing Out")
        do {
            try db.auth.signOut()
            print("AuthRepository signOut : success")
            completion(.success(()))
        } catch let error {
            print("AuthRepository signOut : error \(error)")
            completion(.failure(error))
        }
    }
}
