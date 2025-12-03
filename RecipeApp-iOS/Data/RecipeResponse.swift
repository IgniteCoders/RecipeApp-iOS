//
//  RecipeResponse.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable {
    let id: Int
    let name: String
    let image: String
}
