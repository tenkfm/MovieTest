//
//  MovieGridView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieGridView: View {
    @EnvironmentObject var router: MovieListingNavigation.Router
    @StateObject var viewModel = MovieListingViewModel()
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100))
    ]
    
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
                ScrollView {
                    LazyVGrid(columns: adaptiveColumn, spacing: 0) {
                        ForEach(viewModel.payload?.results ?? []) { movie in
                            Button {
                                router.push(.details(id: movie.id))
                            } label: {
                                MovieGridItemView(movie: movie)
                                    .frame(height: 200, alignment: .center)
                                    .background(Color.black)
                                    .task {
                                        if viewModel.hasReachedPageEnd(of: movie) {
                                            viewModel.fetchNextPage()
                                        }
                                    }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .onAppear(perform: viewModel.onAppear)
        .toolbar {
            Button(action: {
                viewModel.refresh()
            }, label: {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
}

#Preview {
    MovieGridView()
}
