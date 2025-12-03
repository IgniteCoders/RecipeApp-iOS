//
//  RecipeProvider.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import Foundation

class RecipeProvider {
    
    static let BASE_URL     = "https://dummyjson.com"
    
    static func findRecipesByName(query: String) async -> [Recipe] {
        guard let url = URL(string: "\(BASE_URL)/recipes/search?q=\(query)") else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode(RecipeResponse.self, from: data).recipes
        } catch {
            debugPrint(error)
            return []
        }
    }
}
