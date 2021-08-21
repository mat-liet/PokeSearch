//
//  PokemonDetailView.swift
//  PokeSearch
//  This will show the detail page for the pokemon.
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    let pokemon: Pokemon
    let pokemonAPI = PokemonAPI()
    
    var body: some View {
        HStack() {
            Spacer()
            VStack() {
                KFImage(URL(string: pokemon.sprites.front_default!))
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("ID: " + String(pokemon.id))
//                Spacer()
                Text("Pokemon type: " + (pokemon.types[0].type?.name!.firstUppercased)!)
                Spacer()
            }
            Spacer()
        }
        .background(pokemonAPI.getPokemonColor(pokemon: pokemon))
        .navigationBarTitle(Text(pokemon.name.firstUppercased), displayMode: .inline)
        
    }
}
