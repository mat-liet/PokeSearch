//
//  ContentView.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon]
    var body: some View {
        NavigationView{
            List(pokemons){
                pokemon in ListRow(individualPokemon: pokemon)
            }.navigationBarTitle(Text("PokeSearch"), displayMode: .inline)
        }.onAppear(){
            PokemonAPI().getPokemonList { (pokemonList) in
//                print(pokemonList.results)
                for pokemon in pokemonList.results {
                    PokemonAPI().getPokemonInfo(url: pokemon.url) { (pokemonDetail) in
                        pokemons.append(pokemonDetail)
//                        print(pokemonDetail.id)
//                        print(output)
                    }
                }
            }
            
        }
    }
}

struct ListRow: View {
    var individualPokemon: Pokemon
    var body: some View {
        HStack{
            Text(individualPokemon.name)
            Spacer()
//            Image("Pokeball")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: 30)
        }.frame(height: 100)
    }
}
