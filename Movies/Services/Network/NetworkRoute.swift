//
//  NetworkRoute.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

protocol NetworkRoute {
    var path: String { get }
    var method: NetworkMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension NetworkRoute {

    var headers: [String : String]? {
        ["accept": "application/json",
         "Authorization": ["Bearer", Environment.movieDBAuthToken].joined(separator: " ")]
    }

    func create(for enviroment: NetworkEnvironment) throws -> URLRequest {        
        guard var components = URLComponents(string: [enviroment.baseUrl.absoluteString, path].joined()) else {
            throw NetworkError(statusCode: .zero, statusMessage: "URL error", success: false)
        }
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw NetworkError(statusCode: .zero, statusMessage: "URL error", success: false)
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()

        return request
    }
}
