//
//  RegistrationView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""

    
    var body: some View {
        
        VStack{
            GreetingView(title: "Get Started. \nCreate your account")
            
            VStack(spacing: 32){
                AuthTextField(iconName: "envelope", value: email, placeHolder: "Email")
                AuthTextField(iconName: "person", value: email, placeHolder: "Username")
                AuthTextField(iconName: "lock", value: email, placeHolder: "Password")
            }
            .padding(.horizontal, 32)
            .padding(.vertical)
            
            
            PrimaryButton(text: "Sign up",onClick: {})
                .padding(32)
            
            Spacer()
            
            NavigationLink(
                destination: { Text("Forgot Password")},
                label: {
                    HStack{
                        Text("Do you have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(Color(.systemBlue))
                }
            )
            .padding(.horizontal,32)

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
