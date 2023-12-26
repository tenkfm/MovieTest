//
//  Container.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation
import Factory

extension Container {
    var network: Factory<Network> {
        Factory(self) { MovieDBNetwork() }
    }
}
