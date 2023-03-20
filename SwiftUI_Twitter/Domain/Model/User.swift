//
//  UserModel.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 17.03.2023.
//

import Foundation


struct User : Codable, Identifiable {
    var id: String = ""
    var email : String = ""
    var name : String = ""
}
