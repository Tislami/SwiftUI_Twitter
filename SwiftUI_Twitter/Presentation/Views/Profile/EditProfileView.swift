//
//  EditProfileView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 23.03.2023.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    @Environment (\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .top){
            
            Color(.red)
                .frame(height: 170)
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing: 32){
                
                Circle()
                    .strokeBorder(lineWidth: 5)
                    .foregroundColor(Color(.white))
                    .frame(width: 75,height: 75)
                    .background(
                        Circle()
                    )
                    .overlay{
                        Image(systemName: "camera")
                            .resizable()
                            .foregroundColor(Color(.white))
                            .frame(width: 30,height: 30)
                    }
                
                EditFieldView(
                    title: "Name",
                    value: $userViewModel.userState.name
                )
                
                EditFieldView(
                    title: "Nickname",
                    value: $userViewModel.userState.name
                )
                
                EditFieldView(
                    title: "Personal",
                    value: $userViewModel.userState.personal,
                    height: 100
                )
                EditFieldView(
                    title: "Location",
                    value: $userViewModel.userState.loaction
                )
                EditFieldView(
                    title: "Web Site",
                    value: $userViewModel.userState.website
                )
                EditFieldView(
                    title: "Birthday",
                    value: $userViewModel.userState.birthday
                )
            
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top,32)
        }
        .navigationTitle(Text("Edit Profile"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(
                    action: {presentationMode.wrappedValue.dismiss()},
                    label: { Text("Save").bold() }
                )
            }
            
            ToolbarItem(placement: .navigationBarLeading){
                Button(
                    action: {presentationMode.wrappedValue.dismiss()},
                    label: { Image(systemName: "arrow.left") }
                )
            }
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditProfileView()
        }
    }
}

private struct EditFieldView: View {
    @State var title: String
    @Binding var value: String
    var height: CGFloat = 50
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .foregroundColor(.gray)
            
            TextField(value, text: $value)
            
            Spacer()
            
            Divider()
                .background(Color(.darkGray))
            
        }.frame(height: height)
    }
}
