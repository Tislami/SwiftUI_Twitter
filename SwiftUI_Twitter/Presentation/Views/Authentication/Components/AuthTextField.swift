//
//  AuthTextField.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct AuthTextField: View {
    
    @State var iconName: String
    @Binding var value: String
    @State var placeHolder: String
    var isSceuryField: Bool = false
    
    var body: some View {
        VStack {
            
            HStack{
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(.darkGray))
                    .frame(width: 20,height: 20)
                
                if isSceuryField{
                    SecureField(value, text: $value, prompt: Text(placeHolder))
                        .padding(.vertical,4)
                }
                else{
                    TextField(value, text: $value, prompt: Text(placeHolder))
                        .padding(.vertical,4)
                }
                
                    
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}
