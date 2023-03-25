//
//  UserState.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 20.03.2023.
//

import Foundation


struct UserState {
    var user : User?
    var errorMessage: String = ""
    var presentAlert: Bool = false
    var isLoading: Bool = false
    var name: String = ""
    var personal: String = ""
    var loaction: String = ""
    var website: String = ""
    var birthday: String = ""
    var isFollowing: Bool = false
}
