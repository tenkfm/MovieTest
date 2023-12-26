//
//  Network.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation
import Combine

protocol Network {
    var decoder: JSONDecoder { get set }
    var environment: NetworkEnvironment { get set }
}

extension Network {

    func fetch<T: Decodable>(route: NetworkRoute) -> AnyPublisher<T, Error> {
        let request = route.create(for: environment)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryCompactMap { result in
                guard (result.response as? HTTPURLResponse)?.statusCode == 200 else {
                    throw try self.decoder.decode(NetworkError.self, from: result.data)
                }
                
                return try self.decoder.decode(T.self, from: result.data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
