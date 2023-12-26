//
//  MovieView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            AsyncImage(
                url: movie.posterURL(.h100)
            ) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            } placeholder: {
                Image("MoviePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            }
            
            VStack {
                HStack {
                    Text(movie.title)
                        .font(.subheadline)
                        .lineLimit(2, reservesSpace: true)
                    Spacer()
                }
                
                HStack {
                    Text(movie.overview)
                        .font(.caption)
                        .lineLimit(3, reservesSpace: true)
                    Spacer()
                }
            }
            
        }
    }
}
