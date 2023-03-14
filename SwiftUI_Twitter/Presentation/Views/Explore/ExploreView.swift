//
//  ExploreView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack(spacing: 16){
                        ForEach(0...25, id: \.self){ _ in
                            NavigationLink(
                                destination: {
                                    ProfileView()
                                },
                                label: {
                                    UserRowView()
                                }
                            )
                        }
                    }.padding(.horizontal)
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
