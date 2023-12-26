//
//  Movie.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct Movie: Identifiable, Decodable {
    var id: Int
    var title: String
    var overview: String
    var voteCount: Int
    var posterPath: String
    
    func posterURL(_ poster: Poster) -> URL? {
        poster.url(path: posterPath)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case voteCount = "vote_count"
        case posterPath = "poster_path"
    }
}
