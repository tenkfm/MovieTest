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
}

extension NetworkRoute {

    var headers: [String : String]? {
        return nil
    }

    func create(for enviroment: NetworkEnvironment) -> URLRequest {
        var request = URLRequest(url: URL(string: [enviroment.baseUrl.absoluteString, path].joined())!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()

        return request
    }
}
