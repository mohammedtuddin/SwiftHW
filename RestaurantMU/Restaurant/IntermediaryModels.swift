//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Mohammed Uddin on 05/19/2021.
//  Copyright © 2021 Mohammed Uddin. All rights reserved.

// Correspond to keys returned by the API under categories
struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
