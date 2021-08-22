//
//  PokemonInformationView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 22/08/2021.
//

import SwiftUI

/**
 This view contains the Pokemon Information view.
 This view contains the type, height and weight of the pokemon in a VStack.
 */
struct PokemonInformationView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(){
            Spacer()
                .frame(height: 25)
            Text("Pokemon Information")
                .font(Font.custom("PKMN RBYGSC", size: 20))
            Spacer()
                .frame(height: 25)
            Text("Pokemon type: " + (pokemon.types[0].type?.name!.firstUppercased)!)
                .font(Font.custom("PKMN RBYGSC", size: 12))
            Spacer()
                .frame(height: 10)
            Text("Height of pokemon in decimetres: " + String(pokemon.height))
                .font(Font.custom("PKMN RBYGSC", size: 12))
            Spacer()
                .frame(height: 10)
            Text("Weight of pokemon in hectograms: " + String(pokemon.weight))
                .font(Font.custom("PKMN RBYGSC", size: 12))
            Spacer()
                .frame(height: 25)
        }
    }
}
