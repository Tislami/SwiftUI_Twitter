//
//  UserStats.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 13.03.2023.
//

import SwiftUI

struct UserStatsView: View {
    let following: String
    let followers: String
    var body: some View {
        HStack(spacing: 16){
            
            HStack{
                Text("2").font(.subheadline).bold()
                
                Text(following)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Text("12").font(.subheadline).bold()
                
                Text(followers)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

