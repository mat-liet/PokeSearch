//
//  Pokemon.swift
//  PokeSearch
//
//  Created by Matej Lietava on 19/08/2021.
//

import SwiftUI

/**
 This class will contain all of the structs required to parse the JSON.
 */
struct PokemonList: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PokemonOverview]
}

struct PokemonOverview: Codable {
    var name: String
    var url: String
}

struct Pokemon: Identifiable, Decodable {
//    var abilities: [Ability]
//    var base_experience: Int
//    var forms: [PokemonOverview]
//    var game_indices: [GameIndex]
//    var height: Int
//    var held_items: [HeldItem]
    var id: Int
//    var is_default: Bool
//    var location_area_encounters: String
//    var moves: [Move]
    var name: String
//    var order: Int
//    var past_types: [PastTypes]
//    var species: Species
//    var sprites: Sprite
//    var stats: [Stats]
//    var types: [Type]
//    var weight: Int
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
       }
}

struct Ability: Codable {
    var ability: SingleAbility
    var is_hidden: Bool
    var slot: Int
}

struct SingleAbility: Codable {
    var name: String
    var url: String
}

struct GameIndex:  Codable{
    var game_index: Int
    var version: Version
}

struct Version: Codable {
    var name: String
    var url: String
}


struct HeldItem: Codable {
    var item: Item
    var version_details: [VersionDetail]
}

struct Item: Codable {
    var name: String
    var url: String
}

struct VersionDetail: Codable {
    var rarity: Int
    var version: Version
}

struct Move: Codable {
    var move: SingleMove
    var version_group_details: [VersionGroupDetail]
}

struct SingleMove: Codable {
    var name: String
    var url: String
}

struct VersionGroupDetail: Codable {
    var level_learned_at: Int
    var move_learn_method: SingleMove
    var version_group: VersionGroup
}

struct VersionGroup: Codable {
    var name: String
    var url: String
}

struct PastTypes: Codable {
    var generation: Generation
    var types: [Type]
}

struct Generation: Codable {
    var name: String
    var url: String
}

struct Type: Codable {
    var slot: Int
    var type: SingleType
}

struct SingleType: Codable {
    var name: String
    var url: String
}

struct Species: Codable {
    var name: String
    var url: String
}

struct Sprite: Codable {
    var front_default: String?
    var front_shiny: String?
    var front_female: String?
    var front_shiny_female: String?
    var back_default: String?
    var back_shiny: String?
    var back_female: String?
    var back_shiny_female: String?
}

struct Stats: Codable {
    var base_stat: Int
    var effort: Int
    var stat: Stat
}

struct Stat: Codable {
    var name: String
    var url: String
}
