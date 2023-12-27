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
    var networkState: NetworkState = .loading
    @Injected(\.network) var network
    var route: NetworkRoute
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    var payload: NetworkResource?
    
    lazy var payloadProcessor: ((NetworkResource) -> Void)? = { payload in
        if self.isNextPageLoading {
            self.payload?.page = payload.page
            self.payload?.results.append(contentsOf: payload.results)
        } else {
            self.payload = payload
        }
    }
    
    private var isNextPageLoading: Bool = false
    
    init() {
        route = DiscoverMovieRoute(page: 1)
    }
    
    func hasReachedPageEnd(of movie: Movie) -> Bool {
        payload?.results.last?.id == movie.id
    }
    
    func refresh() {
        payload = nil
        isNextPageLoading = false
        route = DiscoverMovieRoute(page: 1)
        do {
            try fetch(route: route)
        } catch {
            self.networkState = .error(error)
            self.objectWillChange.send()
        }
    }
    
    func fetchNextPage() {
        guard let payload else { return }
        
        isNextPageLoading = true
        route = DiscoverMovieRoute(page: payload.page + 1)
        do {
            try fetch(route: route)
        } catch {
            self.networkState = .error(error)
            self.objectWillChange.send()
        }
    }
}
