//
//  Movie.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct Movie: Identifiable, Decodable, Hashable {
    var id: Int
    var title: String
    var overview: String
    var voteCount: Int
    var posterPath: String
    var popularity: Float
    var runtime: Int?
    let adult: Bool
    let releaseDate: Date
    
    var duration: String {
        guard let runtime else { return "" }
        
        return ["\(runtime / 60)h", "\(runtime % 60)m"].joined(separator: " ")
    }
    
    var year: String {
        return DateFormatter.yyyy.string(from: releaseDate)
    }
    
    func posterURL(_ poster: Poster) -> URL? {
        poster.url(path: posterPath)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case popularity
        case runtime
        case adult
        case releaseDate = "release_date"
    }
}
