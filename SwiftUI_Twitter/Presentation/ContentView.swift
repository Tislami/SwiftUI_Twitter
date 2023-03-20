//
//  ContentView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group{
            if authViewModel.authState.id == nil{
                LoginView()
            }
            else {
                MainInterfaceView()
                    .onAppear{
                        print("onAppear")
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
            
            SideMenuView()
                .offset(x: showSideMenu ? 0: -300)
                .frame(width: 300)
                .background( showSideMenu ? Color(.white): Color(.clear))
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
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
