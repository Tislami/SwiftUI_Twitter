//
//  SearchTextField.swift
//  SwiftUI_Twitter
//
//  Created by Tariyel Islami on 23.03.2023.
//

import SwiftUI

struct SearchTextField: View {
    @State private var searchText: String = ""
    let onSubmit: (String)-> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .onSubmit {
                   onSubmit(searchText)
                }
                .padding(.horizontal, 10)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(onSubmit: {_ in })
    }
}
