//
//  NetworkError.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import Foundation

struct NetworkError: Decodable, LocalizedError {
    var statusCode: Int
    var statusMessage: String
    var success: Bool
    
    var errorDescription: String? {
        statusMessage
    }
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
