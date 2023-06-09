//
//  ContentView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
//            MainTabView()
                        
        ZStack{
            if authViewModel.authState.uid == nil {
                LoginView()
            }else {
                if userViewModel.userState.user == nil {
                    ZStack{
                        switch authViewModel.authState.authStatus{
                        case .Logged:
                            ProgressView()
                                .onAppear{
                                    print("ContentView Logged : getting user")
                                    userViewModel.getUser(id: authViewModel.authState.uid!)}
                        case .Registered:
                            ProgressView()
                                .onAppear{
                                    print("ContentView Registered : creating user")
                                    userViewModel.createUser(user: User(
                                        id: authViewModel.authState.uid!,
                                        email: authViewModel.authState.email,
                                        name: authViewModel.authState.fullName
                                    ))}
                        }
                    }.alert(isPresented: $userViewModel.userState.presentAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(userViewModel.userState.errorMessage),
                            dismissButton: .default(Text("OK"),
                            action: authViewModel.signOut)
                        )
                    }
                }
                else if (userViewModel.userState.user != nil){
                    MainInterfaceView(user: userViewModel.userState.user!)
                        .onDisappear{ userViewModel.closeUser() }
                }
            }
        }
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
    
private struct MainInterfaceView:  View {
    
    let user: User
    
    @State private var showSideMenu : Bool = false
    @State private var showNewTweetView: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            MainTabView()
                .navigationBarHidden(showSideMenu)
            
            if showSideMenu{
                ZStack{
                    Color(.black).opacity(showSideMenu ? 0.25: 0.0 )
                }
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.easeInOut){
                        showSideMenu = false
                    }
                }
            }
            
            SideMenuView(user: user)
                .offset(x: showSideMenu ? 0: -300)
                .frame(width: 300)
                .background( showSideMenu ? Color(.white): Color(.clear))
            
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(
                    action: { withAnimation(.easeInOut){
                        showSideMenu.toggle()
                    } },
                    label: {
                        Circle().frame(width: 32,height: 32)
                    }
                )
            }
        }
        .onAppear{ showSideMenu = false }
    }
}

