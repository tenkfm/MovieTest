//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation
import Factory
import Combine

class MovieDetailsViewModel: ObservableObject, NetworkViewModel {
    typealias NetworkResource = Movie
    var networkState: NetworkState = .loading
    @Injected(\.network) var network
    var route: NetworkRoute
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    var payloadProcessor: ((NetworkResource) -> Void)? = nil
    
    var payload: NetworkResource?
    
    init(id: Int) {
        route = MovieDetailsRoute(id: id)
    }
}
