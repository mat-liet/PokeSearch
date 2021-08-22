//
//  PokemonView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI
import Kingfisher

// Reference for Kingfisher: https://github.com/onevcat/Kingfisher

/**
 This view represents a pokemon in a list.
 */
struct PokemonView: View {
    var individualPokemon: Pokemon
    var pokemonAPI = PokemonAPI()
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            // Firstly, try get official artwork (every pokemon should have this).
            // If not, get game sprite, if not, get placeholder
            KFImage.url(URL(string: (individualPokemon.sprites.other?.officialArtwork.front_default  ?? individualPokemon.sprites.front_default) ??
                    "https://upload.wikimedia.org/wikipedia/commons/3/39/Pokeball.PNG"))
                .cacheOriginalImage()
                .resizable()
                .scaledToFit()
                .frame(width: 80.0, height: 80.0, alignment: .center)
                .padding(.all, 20)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack {
                    Text(individualPokemon.name.firstUppercased)
                        .foregroundColor(Color.black)
                        .font(Font.custom("PKMN RBYGSC", size: 15))
                }
            })
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .background(pokemonAPI.getPokemonColor(pokemon: individualPokemon))
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}


