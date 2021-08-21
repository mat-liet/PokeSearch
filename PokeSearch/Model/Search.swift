//
//  Search.swift
//  PokeSearch
//
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI

/**
 This class is the model for the searchbar.
 Reference: https://www.appcoda.com/swiftui-search-bar/
 */
struct Search: View {
    @Binding var searchName: String
    
    var body: some View {
        HStack {
            TextField("Search for a name", text: $searchName)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
        }
    }
}
