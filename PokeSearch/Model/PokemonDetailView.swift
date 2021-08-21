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
                VStack{
                    Spacer()
                        .frame(height: 10)
                    Text("Pokemon Information:")
                        .font(.title)
                    Spacer()
                    Text("Pokemon type: " + (pokemon.types[0].type?.name!.firstUppercased)!)
                    Text("Height of pokemon in decimetres: " + String(pokemon.height))
                    Text("Weight of pokemon in hectograms: " + String(pokemon.weight))
                    Spacer()
                }
                Text("Pokemon Abilities")
                    .font(.title)
                VStack {
                    ForEach(pokemon.abilities, id: \.self) { ability in
                        Text("\u{2022} " + ability.ability.name.firstUppercased)
                    }
                }
            }
            Spacer()
        }
        .background(pokemonAPI.getPokemonColor(pokemon: pokemon))
        .navigationBarTitle(Text(pokemon.name.firstUppercased), displayMode: .inline)
        
    }
}
