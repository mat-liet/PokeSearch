//
//  Pokemon.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI
import Foundation

/**
 This class will contain all of the structs required to parse the JSON.
 Majority of these structs were generated using quickType (iOS app that generates JSON structures)
 */
// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int!
    let next, previous: String!
    let results: [PokemonOverview]!
}

// MARK: - PokemonOverview
struct PokemonOverview: Codable {
    let name: String!
    let url: String!
}

//MARK: - Pokemon
struct Pokemon: Decodable, Hashable {
    var abilities: [Ability]
    var height: Int
    var id: Int
    var name: String
    var sprites: Sprite
    var stats: [Stats]
    var types: [Type]
    var weight: Int
}

// MARK: - Ability
struct Ability: Codable, Hashable {
    var ability: SingleAbility
    var is_hidden: Bool
    var slot: Int
}

// MARK: - Single Ability
struct SingleAbility: Codable, Hashable {
    var name: String
    var url: String
}

// MARK: - Type
struct Type: Codable, Hashable {
    var slot: Int?
    var type: SingleType?
}

// MARK: - Single Type
struct SingleType: Codable, Hashable {
    var name: String?
    var url: String?
}

// MARK: - Sprite
struct Sprite: Codable, Hashable {
    var front_default: String?
    var front_shiny: String?
    var front_female: String?
    var front_shiny_female: String?
    var back_default: String?
    var back_shiny: String?
    var back_female: String?
    var back_shiny_female: String?
    var other: Other?
}

// MARK: - Other
struct Other: Codable, Hashable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - Official Artwork
struct OfficialArtwork: Codable, Hashable {
    var front_default: String?
}

// MARK: - Stats
struct Stats: Codable, Hashable {
    var base_stat: Int
    var effort: Int
    var stat: Stat
}

// MARK: - Stat
struct Stat: Codable, Hashable {
    var name: String
    var url: String
}
