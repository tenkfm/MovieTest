//
//  NetworkViewModel.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation
import Combine

protocol NetworkViewModel: ObservableObject {
    associatedtype NetworkResource: Decodable
    
    var objectWillChange: ObservableObjectPublisher { get }
    var networkState: NetworkState { get set }
    var network: Network { get set }
    var route: NetworkRoute { get }
    var bag: Set<AnyCancellable> { get set }
    var payloadProcessor: ((NetworkResource) -> Void)? { get set }
    var payload: NetworkResource? { get set }
    
    func onAppear()
}

extension NetworkViewModel {
    func fetch(route: NetworkRoute) throws {
        (try network.fetch(route: route) as AnyPublisher<NetworkResource, Error>)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.networkState = .error(error)
                    self.objectWillChange.send()
                default:
                    break
                }
            }, receiveValue: { payload in
                if let payloadProcessor = self.payloadProcessor {
                    payloadProcessor(payload)
                } else {
                    self.payload = payload
                }
                self.networkState = .success
                self.objectWillChange.send()
            })
            .store(in: &bag)
    }

    func onAppear() {
        do {
            try fetch(route: route)
        } catch {
            self.networkState = .error(error)
            self.objectWillChange.send()
        }
    }
}
