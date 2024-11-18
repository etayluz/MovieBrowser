//
//  MovieGridViewModel.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import Foundation

@MainActor
class MovieGridViewModel: ObservableObject {
    @Published var movies: [MovieSummary] = []
    
    init() {
        Task {
            await fetchMovies()
        }
    }
    
    func fetchMovies() async {
        do {
            movies = try await NetworkManager.shared.fetchPopularMovies()
        } catch {
            print("Failed to fetch movies: \(error)")
            // Handle error (e.g., show an error message)
        }
    }
}
