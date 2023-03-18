//
//  LoginView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        Form{
            VStack{
                GreetingView(title: "Hello \nWelcome Back")
                
                VStack(spacing: 32){
                    AuthTextField(
                        iconName: "envelope",
                        value: $viewModel.authState.email,
                        placeHolder: "Email"
                    )
                    
                    AuthTextField(
                        iconName: "lock",
                        value: $viewModel.authState.password,
                        placeHolder: "Password",
                        isSceuryField: true
                    )
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
                
                
                PrimaryButton(text: "Sign in", onClick: {
                    print("on sign in")
                    //viewModel.login()
                }
                ).padding(.horizontal,32)
                
                Spacer()
                
                NavigationLink(
                    destination: { RegistrationView() },
                    label: {
                        HStack{
                            Text("Don't have an account?")
                            Text("Sign Up")
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
