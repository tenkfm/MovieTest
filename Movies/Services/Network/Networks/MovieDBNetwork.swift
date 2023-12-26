//
//  MovieDBNetwork.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct MovieDBNetwork: Network {
    var decoder: JSONDecoder = JSONDecoder()
    var environment: NetworkEnvironment = MovieDBNetworkEnvironment()
}
