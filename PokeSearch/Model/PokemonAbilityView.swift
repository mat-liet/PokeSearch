//
//  PokemonAbilityView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 22/08/2021.
//

import SwiftUI

/**
 This view holds the Pokemon Abilities section.
 This section lists all of the abilities of the given pokemon in a VStack.
 */
struct PokemonAbilityView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack() {
            Text("Pokemon Abilities")
                .font(Font.custom("PKMN RBYGSC", size: 20))
            Spacer()
                .frame(height: 25)
            ForEach(pokemon.abilities, id: \.self) { ability in
                Text("\u{2022} " + ability.ability.name.firstUppercased)
                    .font(Font.custom("PKMN RBYGSC", size: 12))
                Spacer()
                    .frame(height: 10)
            }
        }
    }
}
