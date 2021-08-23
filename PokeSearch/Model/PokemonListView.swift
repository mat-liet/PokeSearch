//
//  PokemonListView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 22/08/2021.
//

import SwiftUI

/**
 This is the list view for the Pokemon.
 This view creates the search bar and the list of all the pokemon. Using the PokemonViewController to
 load more pokemon when needed.
 */
struct PokemonListView: View {
    @StateObject var pokemonController = PokemonViewController()
    // Variable holding the string used to search pokemon names
    @State var searchName: String = ""
    // Reference: https://apoorv487.medium.com/pagination-in-swiftui-5a90ea952876
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Search(searchName: $searchName)
                        .padding(.top, 15)
                    // Filter out the pokemon containing the search word
                    ForEach(pokemonController.pokemon.filter { test in
                        self.searchName.isEmpty ? true : test.name.lowercased().contains(self.searchName.lowercased())
                    }, id: \.self) { pokemon in
                        // NavigationLink to show the detail page on click
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(individualPokemon: pokemon)
                                .onAppear() {
                                    // Load more pokemon
                                    pokemonController.loadMorePokemon()
                                }
                        }
                    }
                }
            }
            //Sets the title of the list view
            .navigationBarTitle("PokeSearch", displayMode: .inline)
        }
    }
}
