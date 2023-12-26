//
//  Poster.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

enum Poster: String {
    case h50
    case h100
    case w200
    
    func url(path: String) -> URL? {
        URL(string: [Environment.movieDBImageURL.absoluteString, "t", "p", self.rawValue, path].joined(separator: "/"))
    }
}
