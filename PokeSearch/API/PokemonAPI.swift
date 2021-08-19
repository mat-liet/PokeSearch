//
//  PokemonAPI.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

/**
 This method will retrieve all of the pokemons using the API call and return an array of them.
 */
// Taken from: https://www.youtube.com/watch?v=1en4JyW3XSI
class PokemonAPI {
    func getPokemonList(completion: @escaping (PokemonList) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=2000") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let pokemons = try! JSONDecoder().decode(PokemonList.self, from: data!)
            DispatchQueue.main.async {
                completion(pokemons)
            }
        }.resume()
    }
    
    func getPokemonInfo(url: String, completionHandler: @escaping (Pokemon) -> ()) {
        guard let urlNew = URL(string: url) else {return}
        let config = URLSessionConfiguration.default
//        config.timeoutIntervalForRequest NEED TO LOOK AT THIS TOMORROW
        URLSession.shared.dataTask(with: urlNew) { (data, response, error) in
//            print(response)
//            print(error)
            print(urlNew)
            let pokemon = try! JSONDecoder().decode(Pokemon.self, from: data!)
            DispatchQueue.main.async {
                completionHandler(pokemon)
            }
        }
        .resume()
        
        // https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/
//        let newUrl = URL(string: url)!
//        let task = URLSession.shared.dataTask(with: newUrl, completionHandler: { (data, response, error) in
//          if let error = error {
//            print("Error with fetching pokemon: \(error)")
//            return
//          }
//
//          print(response)
//
//            guard let data = data else {return}
//            do {
//                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
//                DispatchQueue.main.async {
//                    print(newUrl)
//                    completionHandler(pokemon)
//                }
//            } catch {
//                print(error)
//            }
//        })
//        task.resume()
    }
}
