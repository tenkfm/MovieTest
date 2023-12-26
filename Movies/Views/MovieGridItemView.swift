//
//  MovieGridItemView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieGridItemView: View {
    let movie: Movie
    
    var body: some View {
        AsyncImage(
            url: movie.posterURL(.w200)
        ) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
        } placeholder: {
            Image("MoviePlaceholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
        }
        .overlay(alignment: .bottom) {
            HStack {
                Spacer()
                Text(movie.title)
                    .lineLimit(2, reservesSpace: true)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
            .background(content: {
                Color.black
                    .blur(radius: 20)
            })
        }
    }
}

