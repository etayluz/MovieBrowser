//
//  NetworkManager.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import Foundation

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://hoopla-ws.hoopladigital.com"
    
    func fetchPopularMovies() async throws -> [MovieSummary] {
        let url = URL(string: "\(baseURL)/kinds/7/titles/top")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let movies = try JSONDecoder().decode([MovieSummary].self, from: data)
        return movies
    }
    
    func fetchMovieDetail(id: Int) async throws -> MovieDetail {
        let url = URL(string: "\(baseURL)/titles/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
        return movieDetail
    }
    
    func getImageURL(for artKey: String) -> URL {
        return URL(string: "https://d2snwnmzyr8jue.cloudfront.net/\(artKey)_270.jpeg")!
    }
}
