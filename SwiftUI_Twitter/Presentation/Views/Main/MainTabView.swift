//
//  MainTabView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex : Int = 0
    
    var body: some View {
        TabView(
            selection: $selectedIndex){
                
                HomeView().onTapGesture {
                    self.selectedIndex = 0
                }.tabItem({
                    Image(systemName: "house")
                }).tag(0)
                
                ExploreView().onTapGesture {
                    self.selectedIndex = 1
                }.tabItem({
                    Image(systemName: "magnifyingglass")
                }).tag(1)
                
                NotificationView().onTapGesture {
                    self.selectedIndex = 2
                }.tabItem({
                    Image(systemName: "bell")
                }).tag(2)
                
                MessagesView().onTapGesture {
                    self.selectedIndex = 3
                }.tabItem({
                    Image(systemName: "envelope")
                }).tag(3)
                
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
