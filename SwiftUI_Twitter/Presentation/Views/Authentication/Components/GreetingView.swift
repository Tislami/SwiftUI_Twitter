//
//  GreetingView.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct GreetingView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.leading)
            .frame(maxWidth: .infinity,maxHeight: 250,alignment: .leading)
            .background(Color(.systemBlue))
            .clipShape( AuthRaoundedShape(corners: [.bottomRight],cornerRadius: 80) )
            .ignoresSafeArea()
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(title: "Hello \nWelcome Back")
    }
}
