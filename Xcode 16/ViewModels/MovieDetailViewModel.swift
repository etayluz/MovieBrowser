//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    private let movieID: Int
    
    init(movieID: Int) {
        self.movieID = movieID
        Task {
            await fetchMovieDetail()
        }
    }
    
    func fetchMovieDetail() async {
        do {
            movieDetail = try await NetworkManager.shared.fetchMovieDetail(id: movieID)
        } catch {
            print("Failed to fetch movie detail: \(error)")
            // Handle error (e.g., show an error message)
        }
    }
}
