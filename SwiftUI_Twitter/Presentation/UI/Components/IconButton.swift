//
//  IconButton.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct IconButton: View {
    var action : ()-> Void
    var icon: String
    
    var body: some View {
        
        Button(action: action,
               label: {
            Image(systemName: icon)
                .font(.subheadline)
        }
        )
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(action: {}, icon:  "bubble.left")
    }
}
