//
//  RegistrationView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack{
            VStack{
                GreetingView(title: "Get Started. \nCreate your account")
                
                VStack(spacing: 32){
                    AuthTextField(iconName: "envelope", value: $viewModel.authState.email, placeHolder: "Email")
                    AuthTextField(iconName: "person", value: $viewModel.authState.fullName, placeHolder: "Username")
                    AuthTextField(iconName: "lock", value: $viewModel.authState.password, placeHolder: "Password",isSceuryField: true)
                }
                .padding(.horizontal, 32)
                .padding(.vertical)
                
                PrimaryButton(text: "Sign up",onClick: {
                    print("sign up clicked")
                    viewModel.signUp()},
                    disabled: viewModel.authState.isLoading
                ).padding(32)
                
                Spacer()
                
                NavigationLink(
                    destination: { LoginView() },
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
        }.toolbar(.hidden)
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
