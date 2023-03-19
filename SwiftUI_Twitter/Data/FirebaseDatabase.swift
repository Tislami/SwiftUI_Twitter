//
//  FirebaseDatabase.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class FirebaseDatabase {
    private let db: Firestore
    let auth: FirebaseAuth.Auth
    
    let userCollection: CollectionReference
    let postCollection: CollectionReference
    
    init() {
        db = Firestore.firestore()
        auth = Auth.auth()
        userCollection = db.collection("users")
        postCollection = db.collection("posts")
    }
}
