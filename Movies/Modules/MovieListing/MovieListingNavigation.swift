//
//  MovieListingNavigation.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieListingNavigation: View {
    @StateObject var router: Router = Router()
    
    init() {
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            MovieGridView()
                .navigationTitle("Movie DB")
                .navigationDestination(for: Router.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
    
    class Router: ObservableObject {
        enum Route: Hashable {
            case details(id: Int)
        }
        
        @Published var path: NavigationPath = NavigationPath()
        
        @ViewBuilder func view(for route: Route) -> some View {
            switch route {
            case .details(let id):
                MovieDetailsView(id: id)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                    }
            }
        }
        
        func push(_ appRoute: Route) {
            path.append(appRoute)
        }
        
        func popBack() {
            path.removeLast()
        }
        
        func popToRoot() {
            path.removeLast(path.count)
        }
    }
}

#Preview {
    MovieListingNavigation()
}
