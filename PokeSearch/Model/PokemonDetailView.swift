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
            VStack() {
                Spacer()
                    .frame(height: 50)
                KFImage.url(URL(string: (pokemon.sprites.other?.officialArtwork.front_default  ?? pokemon.sprites.front_default) ??
                        "https://upload.wikimedia.org/wikipedia/commons/3/39/Pokeball.PNG"))
                    .resizable()
                    .cacheOriginalImage()
                    .frame(width: 200, height: 200)
                VStack{
                    Spacer()
                        .frame(height: 25)
                    Text("Pokemon Information")
                        .font(.title)
                    Spacer()
                        .frame(height: 25)
                    Text("Pokemon type: " + (pokemon.types[0].type?.name!.firstUppercased)!)
                    Spacer()
                        .frame(height: 5)
                    Text("Height of pokemon in decimetres: " + String(pokemon.height))
                    Spacer()
                        .frame(height: 5)
                    Text("Weight of pokemon in hectograms: " + String(pokemon.weight))
                    Spacer()
                        .frame(height: 25)
                }
                
                VStack {
                    Text("Pokemon Abilities")
                        .font(.title)
                    Spacer()
                        .frame(height: 25)
                    ForEach(pokemon.abilities, id: \.self) { ability in
                        Text("\u{2022} " + ability.ability.name.firstUppercased)
                        Spacer()
                            .frame(height: 5)
                    }
                }
                
                VStack {
                    Spacer()
                        .frame(height: 20)
                    Text("Pokemon Stats")
                        .font(.title)
                    Spacer()
                        .frame(height: 25)
                }
                Spacer()
            }
            Spacer()
        }
        .background(pokemonAPI.getPokemonColor(pokemon: pokemon))
        .navigationBarTitle(Text(pokemon.name.firstUppercased), displayMode: .inline)
        .border(Color.black)
        
    }
}
