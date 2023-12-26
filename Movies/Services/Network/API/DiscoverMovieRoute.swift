//
//  DiscoverMovieRoute.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

class DiscoverMovieRoute: NetworkRoute {
    var path: String = "/3/discover/movie"
    var method: NetworkMethod = .get
    var headers: [String : String]? = [
        "accept": "application/json",
        "Authorization": ["Bearer", Environment.movieDBAuthToken].joined(separator: " ")
    ]
}
