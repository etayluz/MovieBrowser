//
//  MovieModel.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import Foundation

struct MovieSummary: Codable, Identifiable {
    let id: Int
    let title: String
    let artKey: String
    
    // Map "titleId" from JSON to "id" in the model
    private enum CodingKeys: String, CodingKey {
        case id = "titleId"
        case title
        case artKey
    }
}
