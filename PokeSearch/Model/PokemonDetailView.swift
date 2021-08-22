//
//  PokemonDetailView.swift
//  PokeSearch
//  This will show the detail page for the pokemon.
//  Created by Matej Lietava on 21/08/2021.
//

import SwiftUI
import Kingfisher

/**
 This class displays the Pokemon Details including height, weight and their abilities.
 For the image, get the official artwork, and then if not get the game sprite. Lastly, get a placeholder if it doesnt work.
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
                    VStack(){
                        Spacer()
                            .frame(height: 25)
                        Text("Pokemon Information")
                            .font(Font.custom("PKMN RBYGSC", size: 20))
                        Spacer()
                            .frame(height: 25)
                        Text("Pokemon type: " + (pokemon.types[0].type?.name!.firstUppercased)!)
                            .font(Font.custom("PKMN RBYGSC", size: 12))
                        Spacer()
                            .frame(height: 10)
                        Text("Height of pokemon in decimetres: " + String(pokemon.height))
                            .font(Font.custom("PKMN RBYGSC", size: 12))
                        Spacer()
                            .frame(height: 10)
                        Text("Weight of pokemon in hectograms: " + String(pokemon.weight))
                            .font(Font.custom("PKMN RBYGSC", size: 12))
                        Spacer()
                            .frame(height: 25)
                    }
                    
                    Divider()
                    
                    VStack() {
                        Text("Pokemon Abilities")
                            .font(Font.custom("PKMN RBYGSC", size: 20))
                        Spacer()
                            .frame(height: 25)
                        ForEach(pokemon.abilities, id: \.self) { ability in
                            Text("\u{2022} " + ability.ability.name.firstUppercased)
                                .font(Font.custom("PKMN RBYGSC", size: 12))
                            Spacer()
                                .frame(height: 10)
                        }
                    }
                    
                    Divider()
                    
                    VStack() {
                        Spacer()
                            .frame(height: 20)
                        Text("Pokemon Stats")
                            .font(Font.custom("PKMN RBYGSC", size: 20))
                        Spacer()
                            .frame(height: 25)
                        
                        PokemonStatsView(pokemon: pokemon, pokemonColor: pokemonAPI.getPokemonColor(pokemon: pokemon))
                    }
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
