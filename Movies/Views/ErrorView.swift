//
//  ErrorView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("Oooops. Something went wrong :(")
                .foregroundStyle(.white)
                .font(.title2)

            HStack {
                Text(error.localizedDescription)
                    .foregroundStyle(.white)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}
