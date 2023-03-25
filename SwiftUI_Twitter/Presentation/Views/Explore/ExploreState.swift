//
//  ExploreState.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 22.03.2023.
//

import Foundation


struct ExploreState{
    var users : [User] = []
    var errorMessage: String = ""
    var presentAlert: Bool = false
    var isLoading: Bool = false
}
