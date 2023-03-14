//
//  AuthTextField.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct AuthTextField: View {
    
    @State var iconName: String
    @State var value: String
    @State var placeHolder: String
    
    var body: some View {
        VStack {
            
            HStack{
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(.darkGray))
                    .frame(width: 20,height: 20)
                
                TextField(value, text: $value, prompt: Text(placeHolder))
                    .padding(.vertical,4)
                    
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(iconName: "envelope", value: "Email", placeHolder: "Email")
    }
}
