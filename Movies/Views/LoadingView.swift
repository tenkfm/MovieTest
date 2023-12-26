//
//  LoadingView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI


struct LoadingView: View {
    let message: String
    
    var body: some View {
        VStack {
            ProgressView()
            Text(message)
        }
    }
}
