//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

// taken from: https://stackoverflow.com/questions/26306326/swift-apply-uppercasestring-to-only-the-first-letter-of-a-string
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

struct ContentView: View {
    @ObservedObject var pokemonData = PokemonData()
    @State var pokemons: [Pokemon]
//    var body: some View {
//        NavigationView{
//            List(pokemons){
//                pokemon in ListRow(individualPokemon: pokemon)
//            }.navigationBarTitle(Text("PokeSearch"), displayMode: .inline)
//        }.onAppear(){
//            pokemonData.fetchMembers()
//        }
//    }
    
    var body: some View {
            NavigationView {
                List {
                    // 1. Members
                    ForEach(pokemonData.members) { member in
                        PokemonView(individualPokemon: member)
                            
                    }
                    Button("Button title") {
                        print("Button tapped!")
                    }
                    .onAppear() {
                        pokemonData.fetchMembers()
                    }
                
                }
                
                .navigationBarTitle("Members")
            }
        }
}
