//
//  PrimaryButton.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 15.03.2023.
//

import SwiftUI

struct PrimaryButton: View {
    let text : String
    let onClick : ()-> Void
    var disabled: Bool = false
    
    var body: some View {
        Button(
            action: onClick,
            label: {
                Text(text)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical,8)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 80)
                            .foregroundColor(.blue)
                    )
            }
        ).shadow(color: .gray.opacity(0.5), radius: 10)
            .disabled(disabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Sign in", onClick: {})
    }
}
