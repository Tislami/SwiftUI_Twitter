//
//  LoginView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            GreetingView(title: "Hello \nWelcome Back")
            
            VStack(spacing: 32){
                AuthTextField(iconName: "envelope", value: email, placeHolder: "Email")
                AuthTextField(iconName: "lock", value: email, placeHolder: "Password")
            }
            .padding(.horizontal,32)
            

            NavigationLink(
                destination: { Text("Forgot Password")},
                label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .frame(maxWidth: .infinity,alignment: .trailing)
                }
            ).padding(.trailing,32)
            .padding(.vertical,24)
            
            
            PrimaryButton(text: "Sign in")
                .padding(.horizontal,32)
            
            Spacer()
            
            NavigationLink(
                destination: { Text("Forgot Password")},
                label: {
                    Text("Do you have an accoun? Sign in")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
            )
            .padding(.horizontal,32)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
