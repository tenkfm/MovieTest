//
//  MovieGridView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var viewModel = MovieListingViewModel()
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100))
    ]
    
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
                ScrollView {
                    LazyVGrid(columns: adaptiveColumn, spacing: 0) {
                        ForEach(payload.results) { movie in
                            MovieGridItemView(movie: movie)
                                .frame(height: 200, alignment: .center)
                                .background(Color.black)
                            
                            //                        Text(String(item))
                            //                            .frame(width: 150, height: 150, alignment: .center)
                            //                            .background(.blue)
                            //                            .cornerRadius(10)
                            //                            .foregroundColor(.white)
                            //                            .font(.title)
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    MovieGridView()
}
