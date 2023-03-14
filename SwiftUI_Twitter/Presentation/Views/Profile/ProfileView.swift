//
//  ProfileView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading,spacing: 32){
                HeadView()
                    .padding(.horizontal)
                    .background(Color(.systemBlue).ignoresSafeArea().offset(y: -90))
                
                UserInfoDetailView().padding(.horizontal)
                
                BodyView().padding(.horizontal)
            }
            .background(.white)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



private struct HeadView: View {
    @Environment(\.presentationMode) var mode

    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .bottom, spacing: 8){
                VStack(spacing: 32){
                    
                    Button(
                        action: { mode.wrappedValue.dismiss() },
                        label: { Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundColor(.white)
                                .offset(x:-20)
                            
                        }
                    )
                    
                    Circle().frame(width: 75,height: 75)
                }
                
                Spacer()
            
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .padding(6)
                    .overlay{
                        Circle().stroke(Color.gray,lineWidth: 0.75)
                    }
                
                Button(
                    action: {  },
                    label: {
                        Text("Edit Profile")
                            .font(.subheadline).bold()
                            .frame(width: 120,height: 32)
                            .foregroundColor(.black)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75)
                            }
                    }
                )
            }
            
            VStack(alignment: .leading){
                HStack{
                    Text("Keanu Revees")
                        .font(.title2).bold()
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Text("@Neo")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}


private struct UserInfoDetailView : View{
    
    var body: some View{
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
            
            UserStatsView()
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
