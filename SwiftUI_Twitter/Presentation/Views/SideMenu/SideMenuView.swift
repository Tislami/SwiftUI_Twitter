//
//  SideMenuView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 13.03.2023.
//

import SwiftUI

struct SideMenuView: View {
        
    var body: some View {
        VStack(alignment: .leading,spacing: 32){
            HeadView()
            
            VStack(spacing: 40){
                ForEach(SideMenuItems.allCases, id: \.rawValue){ item in
                    SideMenuRowItemView( item: item )
                }
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SideMenuView()
        }
    }
}




private struct HeadView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Circle()
                .frame(width: 48,height: 48)
            
            
            VStack(alignment: .leading, spacing: 4){
                Text("Keanu Reves")
                    .font(.headline)
                
                Text("@Neo").font(.caption).foregroundColor(.gray)
            }
            
            UserStatsView()
        }
    }
}

private struct SideMenuRowItemView: View {
    
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
            return ProfileView()
        case .lists:
            return ProfileView()
        case .bookmarks:
            return ProfileView()
        case .logout:
            return ProfileView()
        }
    }
}
