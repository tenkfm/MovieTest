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
    var resource: Resource<NetworkResource> { get set }
    var network: Network { get set }
    var route: NetworkRoute { get }
    var bag: Set<AnyCancellable> { get set }

    func onAppear()
}

extension NetworkViewModel {
    func fetch(route: NetworkRoute) {
        (network.fetch(route: route) as AnyPublisher<NetworkResource, Error>)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.resource = .error(error)
                    self.objectWillChange.send()
                default:
                    break
                }
            }, receiveValue: { payload in
                self.resource = .success(payload)
                self.objectWillChange.send()
                print("Loaded")
            })
            .store(in: &bag)
    }

    func onAppear() {
        fetch(route: route)
    }
}
