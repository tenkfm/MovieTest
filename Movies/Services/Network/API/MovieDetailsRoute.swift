//
//  MovieDetailsRoute.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

class MovieDetailsRoute: NetworkRoute {
    var path: String
    var method: NetworkMethod = .get
    var queryItems: [URLQueryItem]?
    
    init(id: Int) {
        path = "/3/movie/\(id)"
    }
}
