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
class PokemonAPI {
    
    // Reference: https://stackoverflow.com/questions/59138722/parsing-json-data-with-urlsession-and-codable
    /**
     This method takes a url and returns a PokemonList object. The PokemonList object contains a [Result] that
     lists 20 pokemon and their URLs.
     */
    func getPokemonList(url: String, completion: @escaping (PokemonList) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    print("Pokemon data is null!")
                    return
                }
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
                    DispatchQueue.main.async {
                        completion(pokemonList) // Return the PokemonList object
                    }
                } catch {
                    print(error)
                }
        }).resume()
    }
    
    /**
     This method returns a Pokemon object by using the JSONDecoder
     Catches errors so that the app does not crash
     */
    func getPokemonInfo(url: String, completion: @escaping (Pokemon) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                print(url)
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let pokemonList = try JSONDecoder().decode(Pokemon.self, from: data)
                    DispatchQueue.main.async {
                        completion(pokemonList) // Return the Pokemon object
                    }
                } catch {
                    print(error)
                }
        }).resume()
    }
    
    /**
     This function retrieves the color of the pokemon depending on the type.
     */
    func getPokemonColor(pokemon: Pokemon) -> Color {
        switch pokemon.types[0].type?.name {
        case "normal":
            return Color(red: 168/255, green: 168/255, blue: 120/255)
        case "fighting":
            return Color(red: 192/255, green: 48/255, blue: 40/255)
        case "flying":
            return Color(red: 168/255, green: 144/255, blue: 240/255)
        case "poison":
            return Color(red: 160/255, green: 64/255, blue: 160/255)
        case "ground":
            return Color(red: 224/255, green: 192/255, blue: 104/255)
        case "rock":
            return Color(red: 184/255, green: 160/255, blue: 56/255)
        case "bug":
            return Color(red: 168/255, green: 184/255, blue: 32/255)
        case "ghost":
            return Color(red: 112/255, green: 88/255, blue: 152/255)
        case "steel":
            return Color(red: 184/255, green: 184/255, blue: 208/255)
        case "fire":
            return Color(red: 240/255, green: 128/255, blue: 48/255)
        case "water":
            return Color(red: 104/255, green: 144/255, blue: 240/255)
        case "grass":
            return Color(red: 120/255, green: 200/255, blue: 80/255)
        case "electric":
            return Color(red: 240/255, green: 208/255, blue: 48/255)
        case "psychic":
            return Color(red: 248/255, green: 88/255, blue: 136/255)
        case "ice":
            return Color(red: 152/255, green: 216/255, blue: 216/255)
        case "dragon":
            return Color(red: 112/255, green: 56/255, blue: 248/255)
        case "dark":
            return Color(red: 112/255, green: 88, blue: 72/255)
        case "fairy":
            return Color(red: 238/255, green: 153/255, blue: 172/255)
        case .none:
            return Color.white
        case .some(_):
            return Color.white
        }
    }
    
    
}
