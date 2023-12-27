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
        
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            HStack {
                Spacer()
                Text(message)
                    .foregroundStyle(.white)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}
