//
//  MoviesApp.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 21/12/2023.
//

import SwiftUI
import SwiftData

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListingNavigation()
        }
    }
}
