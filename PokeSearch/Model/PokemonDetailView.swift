//
//  PokemonDetailView.swift
//  PokeSearch
//  This will show the detail page for the pokemon
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Image("Pokeball")
            Spacer()
            Text(String(pokemon.id))
            Spacer()
            Text(pokemon.name)
        }
    }
}
