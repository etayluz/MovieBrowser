//
//  MovieGridView.swift
//  MovieBrowser
//
//  Created by Etay Luz on 11/13/24.
//

import SwiftUI
import Kingfisher

struct MovieGridView: View {
    @StateObject private var viewModel = MovieGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieID: movie.id)) {
                            VStack {
                                // Use KFImage for loading the image from a URL
                                KFImage(NetworkManager.shared.getImageURL(for: movie.artKey))
                                    .resizable()             // Makes the image resizable
                                    .scaledToFit()           // Scales the image to fit while maintaining aspect ratio
                                    .frame(maxWidth: .infinity)  // Makes the image take the full available width
                                    .padding()  // Padding around the image
                                Text(movie.title).font(.caption)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}

