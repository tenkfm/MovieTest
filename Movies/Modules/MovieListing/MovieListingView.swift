//
//  MovieListingView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 21/12/2023.
//

import SwiftUI

struct MovieListingView: View {
    @EnvironmentObject var router: MovieListingNavigation.Router
    @StateObject var viewModel = MovieListingViewModel()
    
    var body: some View {
        VStack {
            viewModel.networkState.isLoading {
                Group  {
                    Spacer()
                    LoadingView(message: "Loading movies")
                    Spacer()
                }
            }

            viewModel.networkState.hasError {
                ErrorView(error: $0)
            }

            viewModel.networkState.hasResource {
                List {
                    ForEach(viewModel.payload?.results ?? []) { movie in
                        Button {
                            router.push(.details(id: movie.id))
                        } label: {
                            MovieView(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

        }
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    MovieListingView()
}
