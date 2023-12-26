//
//  Environment.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

enum Environment {

    enum Keys {
        enum Plist {
            static let baseURL = "MOVIE_DB_BASE_URL"
            static let movieDBImageURL = "MOVIE_DB_IMAGE_URL"
            static let movieDBAuthToken = "MOVIE_DB_AUTH_TOKN"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not fount")
        }
        return dict
    }()

    static let baseURL: URL = {
        guard let baseURLstring = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Environment Base URL not set in plist for this configuration")
        }
        guard let url = URL(string: baseURLstring) else {
            fatalError("Base URL is invalid")
        }
        return url
    }()

    static let movieDBImageURL: URL = {
        guard let movieDBImageString = Environment.infoDictionary[Keys.Plist.movieDBImageURL] as? String else {
            fatalError("Environment Image URL not set in plist for this configuration")
        }
        guard let url = URL(string: movieDBImageString) else {
            fatalError("Image URL is invalid")
        }
        return url
    }()

    static let movieDBAuthToken: String = {
        guard let movieDBAuthToken = Environment.infoDictionary[Keys.Plist.movieDBAuthToken] as? String else {
            fatalError("Environment movie DB auth token not set in plist for this configuration")
        }
        return movieDBAuthToken
    }()
}
