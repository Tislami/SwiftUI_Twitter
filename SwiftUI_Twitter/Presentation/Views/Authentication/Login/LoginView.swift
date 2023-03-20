//
//  LoginView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//


import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
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
                
                PrimaryButton(
                    text: "Sign In",
                    onClick: {
                        viewModel.signIn()
                        print("sign in clicked")
                    }
                )
                .padding(.horizontal,32)
                
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
            }
            .alert(isPresented: $viewModel.authState.presentAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.authState.errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            if viewModel.authState.isLoading {
                ProgressView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
