//
//  TweetsRowView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            HeadView()
            BodyView().padding(.vertical)
        }
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}

private struct HeadView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 50,height: 50)
                .foregroundColor(Color(.systemBlue))
            
            VStack(alignment: .leading,spacing: 4){
                HStack{
                    Text("Kenau reewes")
                        .font(.subheadline).bold()
                    
                    Text("@Neo")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                    Text("2w")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                Text("The world is not real")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
        }.frame(maxWidth: .infinity,alignment: .leading)
    }
}

private struct BodyView: View {
    var body: some View {
        HStack{
            IconButton(action: {}, icon:  "bubble.left")
            Spacer()
            IconButton(action: {}, icon:  "arrow.2.squarepath")
            Spacer()
            IconButton(action: {}, icon:  "heart")
            Spacer()
            IconButton(action: {}, icon:  "bookmark")
        }.padding(.horizontal)
            .foregroundColor(.gray)
    }
}
