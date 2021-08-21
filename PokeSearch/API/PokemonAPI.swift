//
//  PokemonAPI.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI
import Foundation
import Combine

/**
 This method will retrieve all of the pokemons using the API call and return an array of them.
 */
// Taken from: https://www.youtube.com/watch?v=1en4JyW3XSI
class PokemonAPI {
    func getPokemonList(url: String, completion: @escaping (PokemonList) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let pokemons = try! JSONDecoder().decode(PokemonList.self, from: data!)
            DispatchQueue.main.async {
                completion(pokemons)
            }
        }.resume()
    }
    
    func getPokemonInfo(url: String, completionHandler: @escaping (Pokemon) -> ()) {
        guard let urlNew = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlNew) { (data, response, error) in
            print(urlNew)
            let pokemon = try! JSONDecoder().decode(Pokemon.self, from: data!)
            DispatchQueue.main.async {
                completionHandler(pokemon)
            }
        }
        .resume()
    }
    
    /**
     This function retrieves the color of the pokemon depending on the type.
     */
    func getPokemonColor(pokemon: Pokemon) -> Color {
        if pokemon.types[0].type?.name == "normal" {
            return Color(red: 168/255, green: 168/255, blue: 120/255)
        } else if pokemon.types[0].type?.name == "fighting" {
            return Color(red: 192/255, green: 48/255, blue: 40/255)
        } else if pokemon.types[0].type?.name == "flying" {
            return Color(red: 168/255, green: 144/255, blue: 240/255)
        } else if pokemon.types[0].type?.name == "poison" {
            return Color(red: 160/255, green: 64/255, blue: 160/255)
        } else if pokemon.types[0].type?.name == "ground" {
            return Color(red: 224/255, green: 192/255, blue: 104/255)
        } else if pokemon.types[0].type?.name == "rock" {
            return Color(red: 184/255, green: 160/255, blue: 56/255)
        } else if pokemon.types[0].type?.name == "bug" {
            return Color(red: 168/255, green: 184/255, blue: 32/255)
        } else if pokemon.types[0].type?.name == "ghost" {
            return Color(red: 112/255, green: 88/255, blue: 152/255)
        } else if pokemon.types[0].type?.name == "steel" {
            return Color(red: 184/255, green: 184/255, blue: 208/255)
        } else if pokemon.types[0].type?.name == "fire" {
            return Color(red: 240/255, green: 128/255, blue: 48/255)
        } else if pokemon.types[0].type?.name == "water" {
            return Color(red: 104/255, green: 144/255, blue: 240/255)
        } else if pokemon.types[0].type?.name == "grass" {
            return Color(red: 120/255, green: 200/255, blue: 80/255)
        } else if pokemon.types[0].type?.name == "electric" {
            return Color(red: 240/255, green: 208/255, blue: 48/255)
        } else if pokemon.types[0].type?.name == "psychic" {
            return Color(red: 248/255, green: 88/255, blue: 136/255)
        } else if pokemon.types[0].type?.name == "ice" {
            return Color(red: 152/255, green: 216/255, blue: 216/255)
        } else if pokemon.types[0].type?.name == "dragon" {
            return Color(red: 112/255, green: 56/255, blue: 248/255)
        } else if pokemon.types[0].type?.name == "dark" {
            return Color(red: 112/255, green: 88, blue: 72/255)
        } else {
            return Color(red: 238/255, green: 153/255, blue: 172/255) //fairy
        }
    }
    
    
}
