//
//  ExploreView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var exploreViewModel: ExploreViewModel = ExploreViewModel()
    
    var body: some View {
            ZStack{
                VStack(spacing: 16){
                    SearchTextField(onSubmit: exploreViewModel.getUserByName)
                    
                    ScrollView{
                        LazyVStack(spacing: 16){
                            ForEach(
                                exploreViewModel.exploreState.users,
                                id: \.name
                            ){ user in
                                NavigationLink(
                                    destination: { ProfileView(user: user) },
                                    label: { UserRowView(user: user) }
                                )
                            }
                        }
                    }
                }
                
                if exploreViewModel.exploreState.isLoading {
                    ProgressView()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
