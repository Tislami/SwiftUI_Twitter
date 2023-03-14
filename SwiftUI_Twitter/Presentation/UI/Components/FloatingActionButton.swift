//
//  FloatingActionButton.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 14.03.2023.
//

import SwiftUI

struct FloatingActionButton: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Button(
                action: { },
                label: {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundColor(Color(.systemBlue))
                        .overlay{
                            Image(systemName: "person")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 32,height: 32)
                        }
                }
            )
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
    }
}
