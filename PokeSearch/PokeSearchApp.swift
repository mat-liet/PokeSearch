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
            let singleType1 = SingleType(name: "fighting", url: "")
            let singleType2 = SingleType(name: "bug", url: "")
            let singleType3 = SingleType(name: "water", url: "")
            let type1 = Type(slot: 1, type: singleType1)
            let type2 = Type(slot: 1, type: singleType2)
            let type3 = Type(slot: 1, type: singleType3)
            let sprite1 = Sprite(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png")
            let sprite2 = Sprite(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png")
            let sprite3 = Sprite(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png")
            
            let pokemonOne = Pokemon(id: 1, name: "pikachu", sprites: sprite1, types: [type1])
            let pokemonTwo = Pokemon(id: 2, name: "pikachu", sprites: sprite2, types: [type2])
            let pokemonThree = Pokemon(id: 3, name: "pikachu", sprites: sprite3, types: [type3])
            let pokemons = [
                pokemonOne,
                pokemonTwo,
                pokemonThree
            ]
            ContentView(pokemons: pokemons)
        }
    }
}
