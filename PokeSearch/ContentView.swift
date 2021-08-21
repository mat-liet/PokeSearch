//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonController = PokemonViewController()
    // Partially taken from: https://apoorv487.medium.com/pagination-in-swiftui-5a90ea952876
    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(pokemonController.pokemon, id: \.self) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonView(individualPokemon: pokemon)
                                    .onAppear(){
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
