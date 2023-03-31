//
//  ProfileView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    @Environment (\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.systemBlue)
                .frame(height: 170)
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing: 16){
                HeadView(user: user )
                
                BodyView()
            }
            .padding(.top,36)
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button(
                    action: {presentationMode.wrappedValue.dismiss() },
                    label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                )
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView(
                user: User(
                    email: "deneme@Gmail.com",
                    name: "Deneme",
                    nickName: "@Deneme",
                    following: [],
                    followers: []
                )
            )
        }
    }
}



private struct HeadView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            
            HStack(alignment: .bottom, spacing: 8){
                Circle().frame(width: 75,height: 75)
                
                Spacer()
                
                NavigationLink(
                    destination: { EditProfileView() },
                    label: {
                        Text("Edit Profile")
                            .font(.subheadline).bold()
                            .frame(width: 120,height: 32)
                            .foregroundColor(.black)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray,lineWidth: 0.75)
                            }
                    }
                )
                
//                if user.id ==  {
//
//                } else {
//                    HStack {
//                        Button(
//                            action: {},
//                            label: {
//                                Image(systemName: "envelope")
//                                    .foregroundColor(Color(.black))
//                                    .padding(8)
//                                    .overlay(
//                                        Circle().strokeBorder()
//                                            .foregroundColor(.gray)
//                                    )
//                            }
//                        )
//
//                        Button(
//                            action: {  },
//                            label: {
//                                Text("Follow")
//                                    .font(.subheadline).bold()
//                                    .frame(width: 120,height: 32)
//                                    .foregroundColor(Color(.white))
//                                    .background(.black)
//                                    .cornerRadius(20)
//                            }
//                        )
//                    }
//                }
            }
            
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.title2).bold()
                
                Text(user.nickName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Your moms favorite villian")
                    .font(.subheadline).bold()
                
                HStack(spacing: 16){
                    
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("New York")
                    }
                    
                    HStack{
                        Image(systemName: "link")
                        Text("www.matrix.com")
                    }
                }
                .font(.caption)
                .foregroundColor(.gray)
                
                UserStatsView(
                    following: user.following.count.description,
                    followers: user.followers.count.description
                )
            }
        }
    }
}


private struct BodyView: View {
    @State private(set) var selectedFilter: TweetFilterItems = .tweets
    @Namespace private var animation
    
    var body: some View {
        
        VStack{
            HStack {
                ForEach(TweetFilterItems.allCases, id: \.rawValue) { item in
                    VStack {
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == item ? .semibold : .regular)
                            .foregroundColor(selectedFilter == item ? .black : .gray)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    self.selectedFilter = item
                                }
                            }
                        
                        Capsule()
                            .foregroundColor(selectedFilter == item ? Color(.systemBlue) : Color(.clear))
                            .frame(height: 3)
                    }
                }
            }
            .overlay {
                Divider().offset(y: 15)
            }
            
            
            ScrollView{
                LazyVStack{
                    ForEach(0...9, id: \.self){ _ in
                        TweetsRowView()
                    }
                }
            }.padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
}
