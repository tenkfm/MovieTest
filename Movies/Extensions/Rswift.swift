//
//  Rswift.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 27/12/2023.
//

import SwiftUI
import RswiftResources

extension RswiftResources.ImageResource {
    var image: Image {
        Image(name)
    }
}

extension RswiftResources.ColorResource {
    var color: Color {
        Color(name)
    }
}
