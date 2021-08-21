//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon]
    
    var body: some View {
            NavigationView {
                List(pokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokemonView(individualPokemon: pokemon)
                    }
                }
                .navigationBarTitle("Pokemon", displayMode: .inline)
            }
        }
}
