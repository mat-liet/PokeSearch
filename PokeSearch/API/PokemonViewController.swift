//
//  PokemonViewController.swift
//  PokeSearch
//
//  Created by Matej Lietava on 21/08/2021.
//

import Foundation
import SwiftUI

/**
 Reference for this class: https://apoorv487.medium.com/pagination-in-swiftui-5a90ea952876
 */
class PokemonViewController: ObservableObject {
    
    @Published var pokemon: [Pokemon] = []
    var pokemonAPI = PokemonAPI()
    
    var offset = 0
    var keepGoing = true
    
    init() {
        getPokemon()
    }
    
    func loadMorePokemon(currentPokemon: Pokemon) {
        if keepGoing {
            offset += 20
            getPokemon()
        }
    }
    
    func getPokemon() {
        pokemonAPI.getPokemonList(url: "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)") { (pokemonList) in
            if (pokemonList.results.count < 20) {
                self.keepGoing = false
            }
            for pokemon in pokemonList.results {
                self.pokemonAPI.getPokemonInfo(url: pokemon.url) { (pokemon) in
                    self.pokemon.append(pokemon)
                    self.pokemon = self.pokemon.sorted(by: {$0.id < $1.id})
                }
            }
        }
    }
}
