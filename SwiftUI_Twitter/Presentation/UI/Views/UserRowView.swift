//
//  UserRowView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 12.03.2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 48,height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Neo")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Keanu Rewes")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
