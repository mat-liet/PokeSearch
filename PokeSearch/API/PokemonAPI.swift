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
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: <#T##URLSessionConfiguration#>)
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

class PokemonData: ObservableObject {
    @Published var members = [Pokemon]()
    
    // Tells if all records have been loaded. (Used to hide/show activity spinner)
    var membersListFull = false
    // Tracks last page loaded. Used to load next page (current + 1)
    var currentPage = 0
    // Limit of records per page. (Only if backend supports, it usually does)
    let perPage = 100

    func fetchMembers() {
        let url = "https://pokeapi.co/api/v2/pokemon?offset=\(currentPage)&limit=\(perPage)"
        var cancellable: AnyCancellable?
        PokemonAPI().getPokemonList(url: url) { (pokemonList) in
            for pokemon in pokemonList.results {
                let pokemonURL = URL(string: pokemon.url)!
                cancellable = URLSession.shared.dataTaskPublisher(for: pokemonURL)
                    .tryMap { $0.data }
                    .decode(type: [Pokemon].self, decoder: JSONDecoder())
                    .receive(on: RunLoop.main)
                    .catch { _ in Just(self.members) }
                    .sink { [weak self] in
                        self?.currentPage += 100
                        self?.members.append(contentsOf: $0)
                        // If count of data received is less than perPage value then it is last page.
                        if $0.count < self!.perPage {
                            self?.membersListFull = true
                        }
                    }
            }
        }
        
    }
}
