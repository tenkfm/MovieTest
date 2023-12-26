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
        VStack {
            Text(error.localizedDescription)
        }
    }
}
