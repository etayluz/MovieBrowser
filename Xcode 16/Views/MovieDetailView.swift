//
//  MovieDetailView.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    @State private var showAlert = false
    
    init(movieID: Int) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movieID: movieID))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Movie Cover Art
                if let movie = viewModel.movieDetail {
                    AsyncImage(url: NetworkManager.shared.getImageURL(for: movie.artKey))
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                    
                    // Movie Title
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Genres
                    Text("Genres: \(movie.genres.map { $0.name }.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // Synopsis
                    Text(movie.synopsis)
                        .font(.body)
                        .padding(.vertical, 8)
                    
                    // Artists (Grouped by Role)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(groupedArtists(by: movie.artists)), id: \.key) { role, artists in
                            Text(role)
                                .font(.headline)
                                .foregroundColor(.secondary)
                            ForEach(artists, id: \.id) { artist in
                                Text(artist.name)
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                    // Play Button
                    Button("Start watching \(movie.title)") {
                        showAlert = true
                    }
                    .alert("Start watching \(movie.title)", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .padding(.top)
                } else {
                    ProgressView() // Show loading indicator
                }
            }
            .padding()
            .navigationTitle("Movie Details")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            Task {
               await viewModel.fetchMovieDetail()
            }
        }
    }
    
    // Helper function to group artists by relationship role
    private func groupedArtists(by artists: [MovieDetail.Artist]) -> [String: [MovieDetail.Artist]] {
        Dictionary(grouping: artists, by: { $0.relationship })
    }
}
