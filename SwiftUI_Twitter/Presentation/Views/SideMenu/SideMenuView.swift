//
//  SideMenuView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 13.03.2023.
//

import SwiftUI

struct SideMenuView: View {
    let user : User
    var body: some View {
        VStack(alignment: .leading,spacing: 32){
            HeadView(user: user)
            
            VStack(spacing: 40){
                ForEach(SideMenuItems.allCases, id: \.rawValue){ item in
                    SideMenuRowItemView( user: user, item: item )
                }
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SideMenuView(user: User())
        }
    }
}




private struct HeadView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Circle()
                .frame(width: 48,height: 48)
            
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.name)
                    .font(.headline)
                
                Text(user.nickName).font(.caption).foregroundColor(.gray)
            }
            
            UserStatsView(
                following: user.following.description,
                followers: user.followers.description
            )
        }
    }
}

private struct SideMenuRowItemView: View {
    @State var user: User
    let item : SideMenuItems
    var body: some View {
        
        NavigationLink(destination: getDestination() ) {
            HStack(spacing: 16){
                Image(systemName: item.imageName)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(Color(.black))
                Spacer()
            }
        }
    }
    
    func getDestination() -> some View {
        switch item {
        case .profile:
            return ProfileView(user: user)
        case .lists:
            return ProfileView(user: User())
        case .bookmarks:
            return ProfileView(user: User())
        case .logout:
            return ProfileView(user: User())
        }
    }
}
