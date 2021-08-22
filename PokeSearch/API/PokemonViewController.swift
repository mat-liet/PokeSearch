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
    
    // Array that will be updated with more pokemon
    @Published var pokemon: [Pokemon] = []
    
    // Used to retrieve and decode JSON
    var pokemonAPI = PokemonAPI()
    
    // What # of pokemon we are at
    var offset = 0
    //Flag that decides whether we keep retrieving pokemon from API
    var keepGoing = true
    
    /**
     Init method to initialize the first pokemon in the list.
     */
    init() {
        getPokemon()
    }
    
    /**
     Function that controls the loading of more pokemon
     */
    func loadMorePokemon() {
        if keepGoing {
            offset += 20
            getPokemon()
        }
    }
    
    /**
     This function retrieves all of the pokemon from the url and adds them to the pokemon array
     */
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
