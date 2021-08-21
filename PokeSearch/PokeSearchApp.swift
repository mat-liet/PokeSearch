//
//  PokeSearchApp.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

@main
struct PokeSearchApp: App {
    var body: some Scene {
        WindowGroup {
            let pokemonOne = Pokemon(id: 1, name: "Pikachu")
            let pokemonTwo = Pokemon(id: 2, name: "Pikachu")
            let pokemonThree = Pokemon(id: 3, name: "Pikachu")
            let pokemons = [pokemonOne, pokemonTwo, pokemonThree]
            ContentView(pokemons: pokemons)
        }
    }
}
