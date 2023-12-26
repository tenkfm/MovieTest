//
//  MovieDBNetworkEnvironment.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct MovieDBNetworkEnvironment: NetworkEnvironment {
    var baseUrl: URL = Environment.baseURL
}
