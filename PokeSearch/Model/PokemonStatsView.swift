//
//  PokemonStatsView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 22/08/2021.
//

import SwiftUI

/**
 This class will display the pokemon stats in an overlay to the detail page.
 */
struct PokemonStatsView: View {
    let pokemon: Pokemon
    let pokemonColor: Color
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 50) {
                VStack(alignment: .leading) {
                    Text("HP: " + getStat(stat: "hp", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                    Spacer()
                        .frame(height: 10)
                    Text("Attack: " + getStat(stat: "attack", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                    Spacer()
                        .frame(height: 10)
                    Text("Defence: " + getStat(stat: "defense", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                }
                
                VStack(alignment: .leading) {
                    Text("Special Attack: " + getStat(stat: "special-attack", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                    Spacer()
                        .frame(height: 10)
                    Text("Special Defence: " + getStat(stat: "special-defense", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                    Spacer()
                        .frame(height: 10)
                    Text("Speed: " + getStat(stat: "speed", pokemon: pokemon))
                        .font(Font.custom("PKMN RBYGSC", size: 12))
                }
            }
        }
//        .foregroundColor(pokemonColor)
    }
        
}

func getStat(stat: String, pokemon: Pokemon) -> (String) {
    var statResult = ""
    for stats in pokemon.stats {
        if (stats.stat.name == stat) {
            statResult = String(stats.base_stat)
        }
    }
    return statResult
}
