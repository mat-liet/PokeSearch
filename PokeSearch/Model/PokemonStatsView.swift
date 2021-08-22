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
            Spacer()
                .frame(height: 20)
            Text("Pokemon Stats")
                .font(Font.custom("PKMN RBYGSC", size: 20))
            Spacer()
                .frame(height: 25)
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
    }
        
}

/**
 This function gets the base stat for the given stat name and pokemon.
 Parameter: stat is the name of the stat and the pokemon given is the pokemon whose stat it belongs to
 Return: string of the base_stat
 */
func getStat(stat: String, pokemon: Pokemon) -> (String) {
    var statResult = ""
    for stats in pokemon.stats {
        if (stats.stat.name == stat) {
            statResult = String(stats.base_stat)
        }
    }
    return statResult
}
