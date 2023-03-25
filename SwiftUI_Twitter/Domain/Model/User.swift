//
//  UserModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation


struct User : Codable, Hashable, Identifiable {
    var id: String = ""
    var email : String = ""
    var name : String = ""
    var nickName : String = ""
    var following : [String] = []
    var followers : [String] = []
}
