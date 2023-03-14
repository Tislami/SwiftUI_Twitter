//
//  NewTweet.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 14.03.2023.
//

import SwiftUI

struct NewTweet: View {
    @State var caption : String = ""
    
    var body: some View {
        NavigationView{
            
            HStack(alignment: .top){
                
                Circle()
                    .frame(width: 48,height: 48)
                
                TextField("Enter Text", text: $caption)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
            }
            
            Spacer()
            
        }.toolbar{
            
            ToolbarItem(placement: .navigationBarLeading){
                Button(
                    action: {},
                    label: { Text("Cancel") }
                )
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Button(
                    action: {},
                    label: {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical,8)
                            .background(RoundedRectangle(cornerRadius: 80)
                                .foregroundColor(.blue)
                            )
                        
                    }
                ).foregroundColor(.white)
            }
        }
    }
}

struct NewTweet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ NewTweet() }
    }
}

