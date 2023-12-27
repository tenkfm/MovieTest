//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject var router: MovieListingNavigation.Router
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(id: Int) {
        _viewModel = StateObject(wrappedValue: MovieDetailsViewModel(id: id))
    }
    
    var body: some View {
        VStack {
            viewModel.networkState.isLoading() {
                Group  {
                    Spacer()
                    LoadingView(message: "Loading movie details")
                    Spacer()
                }
            }

            viewModel.networkState.hasError() {
                ErrorView(error: $0)
            }

            viewModel.networkState.hasResource() {
                ScrollView {
                    AsyncImage(
                        url: viewModel.payload?.posterURL(.w500)
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        R.image.moviePlaceholder.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .overlay(alignment: .top, content: {
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom)
                            )
                            .frame(height: 300)
                    })
                    .padding(.bottom, 8)
                    
                    HStack(spacing: 8) {
                        AdultLabelView()
                        
                        Text("·")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        
                        Text(viewModel.payload?.year ?? "")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        
                        Text("·")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        
                        Text(viewModel.payload?.duration ?? "")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text(viewModel.payload?.title ?? "")
                            .foregroundStyle(.white)
                            .font(.title2)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text(viewModel.payload?.overview ?? "")
                            .foregroundStyle(.white)
                            .font(.caption)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear(perform: viewModel.onAppear)
        .background(Color.black)
    }
}

#Preview {
    MovieDetailsView(id: .zero)
}
