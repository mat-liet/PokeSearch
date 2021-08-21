//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonController = PokemonViewController()
    @State var searchName: String = ""
    @State var testArr = []
    // Partially taken from: https://apoorv487.medium.com/pagination-in-swiftui-5a90ea952876
    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        Search(searchName: $searchName)
                            .padding(.top, 15)
                        ForEach(pokemonController.pokemon.filter { test in
                            self.searchName.isEmpty ? true : test.name.lowercased().contains(self.searchName.lowercased())
                        }, id: \.self) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonView(individualPokemon: pokemon)
                                    .onAppear() {
                                        pokemonController.loadMorePokemon(currentPokemon: pokemon)
                                    }
                            }

                        }
                    }
                }
                .navigationBarTitle("Pokemon", displayMode: .inline)
            }
        }
}
