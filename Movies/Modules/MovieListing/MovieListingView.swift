//
//  MovieListingView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 21/12/2023.
//

import SwiftUI

struct MovieListingView: View {
    @ObservedObject var viewModel = MovieListingViewModel()
    
    var body: some View {
        VStack {
            viewModel.resource.isLoading() {
                Group  {
                    Spacer()
                    LoadingView(message: "Loading movies")
                    Spacer()
                }
            }

            viewModel.resource.hasError() {
                ErrorView(error: $0)
            }

            viewModel.resource.hasResource() { payload in
                List {
                    ForEach(payload.results) { movie in
                        MovieView(movie: movie)
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
