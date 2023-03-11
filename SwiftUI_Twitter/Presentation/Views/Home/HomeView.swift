//
//  HomeView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 11.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            ForEach(0...20, id: \.self){ _ in
                TweetsRowView().padding(.horizontal)
                Divider()

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}