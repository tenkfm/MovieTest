//
//  DiscoverMovieResponsePayload.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct DiscoverMovieResponsePayload: Decodable {
    var results: [Movie]
    var page: Int
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
