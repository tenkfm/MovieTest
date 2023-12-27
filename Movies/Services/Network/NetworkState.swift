//
//  NetworkState.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

enum NetworkState {
    case loading
    case success
    case error(Error)
}

extension NetworkState {
    var loading: Bool {
        if case .loading = self {
            return true
        }

        return false
    }

    var error: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
    
    var success: Bool {
        if case .success = self {
            return true
        }
        
        return false
    }
}

extension NetworkState {
    func transform(_ t: @escaping () -> NetworkState) -> NetworkState {
        switch self {
        case .loading:
            return .loading
        case .error(let error):
            return .error(error)
        case .success:
            return .success
        }
    }

    func isLoading<Content: View>(@ViewBuilder content: @escaping () -> Content) -> Content? {

        if loading {
            return content()
        }

        return nil
    }

    func hasResource<Content: View>(@ViewBuilder content: @escaping () -> Content) -> Content? {
        if success {
            return content()
        }

        return nil
    }

    func hasError<Content: View>(@ViewBuilder content: @escaping (Error) -> Content) -> Content? {

        if let error = error {
            return content(error)
        }

        return nil
    }
}
