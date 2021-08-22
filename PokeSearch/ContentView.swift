//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

/**
 This is the list view for the Pokemon.
 */
struct ContentView: View {
    @StateObject var pokemonController = PokemonViewController()
    @State var searchName: String = ""
    // Partially taken from: https://apoorv487.medium.com/pagination-in-swiftui-5a90ea952876
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
