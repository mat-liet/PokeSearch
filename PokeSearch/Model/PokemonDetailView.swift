//
//  PokemonDetailView.swift
//  PokeSearch
//  This will show the detail page for the pokemon.
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI
import Kingfisher

// Reference for Kingfisher: https://github.com/onevcat/Kingfisher
/**
 This class displays the Pokemon Details including height, weight and their abilities.
 For the image, get the official artwork, and then if not get the game sprite. Lastly, get a placeholder if it doesnt work.
 The other sections are all in a VStack. Sections are separated by a Divider()
 */
struct PokemonDetailView: View {
    let pokemon: Pokemon
    let pokemonAPI = PokemonAPI()
    
    var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .center) {
                    Spacer()
                        .frame(height: 50)
                    KFImage.url(URL(string: (pokemon.sprites.other?.officialArtwork.front_default  ?? pokemon.sprites.front_default) ??
                            "https://upload.wikimedia.org/wikipedia/commons/3/39/Pokeball.PNG"))
                        .resizable()
                        .cacheOriginalImage()
                        .frame(width: 200, height: 200)
                    Divider()
                    // MARK: - Pokemon Information
                    PokemonInformationView(pokemon: pokemon)
                    
                    Divider()
                    // MARK: - Pokemon Abilities
                    PokemonAbilityView(pokemon: pokemon)
                    
                    Divider()
                    // MARK: - Pokemon Stats
                    PokemonStatsView(pokemon: pokemon, pokemonColor: pokemonAPI.getPokemonColor(pokemon: pokemon))
                
                    Spacer()
                }
                Spacer()
        }
        .background(pokemonAPI.getPokemonColor(pokemon: pokemon))
        .navigationBarTitle(Text(pokemon.name.firstUppercased), displayMode: .inline)
        .border(Color.black)
        .padding(.bottom, 10)
        
    }
}
