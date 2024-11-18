//
//  MovieDetailModel.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let synopsis: String
    let artKey: String
    let genres: [Genre]
    let artists: [Artist]
    
    // Nested structs for genres and artists to align with the API response
    struct Genre: Codable {
        let id: Int
        let name: String
    }
    
    struct Artist: Codable {
        let id: Int
        let name: String
        let relationship: String  // Actor, Director, etc.
    }
    
    // Mapping keys in case any names differ from expected property names
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case synopsis
        case artKey
        case genres
        case artists
    }
}
