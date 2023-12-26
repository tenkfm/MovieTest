//
//  MovieListingViewModel.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation
import Factory
import Combine

class MovieListingViewModel: ObservableObject, NetworkViewModel {
    typealias NetworkResource = DiscoverMovieResponsePayload
    var resource: Resource<NetworkResource> = .loading
    @Injected(\.network) var network
    var route: NetworkRoute = DiscoverMovieRoute()
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
}
