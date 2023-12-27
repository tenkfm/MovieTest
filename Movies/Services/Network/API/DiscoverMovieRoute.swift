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
    var queryItems: [URLQueryItem]?
    
    init(page: Int) {
        queryItems = [URLQueryItem(name: "page", value: "\(page)")]
    }
}
