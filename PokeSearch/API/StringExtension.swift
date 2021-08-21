//
//  StringExtension.swift
//  PokeSearch
//
//  Created by Matej Lietava on 21/08/2021.
//

import Foundation

// taken from: https://stackoverflow.com/questions/26306326/swift-apply-uppercasestring-to-only-the-first-letter-of-a-string
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
