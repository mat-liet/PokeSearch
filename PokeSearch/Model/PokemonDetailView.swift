//
//  PokemonDetailView.swift
//  PokeSearch
//  This will show the detail page for the pokemon
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    let pokemonAPI = PokemonAPI()
    
    var body: some View {
        VStack {
            Image("Pokeball")
            Spacer()
            Text(String(pokemon.id))
            Spacer()
        }.background(pokemonAPI.getPokemonColor(pokemon: pokemon))
        .navigationBarTitle(Text(pokemon.name.firstUppercased), displayMode: .inline)
    }
}
