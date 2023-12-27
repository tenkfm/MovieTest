//
//  AdultLabelView.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 26/12/2023.
//

import SwiftUI

struct AdultLabelView: View {
    var body: some View {
        Text("NC-17")
            .font(.system(size: 8))
            .foregroundStyle(.white)
            .padding(.vertical, 4)
            .padding(.horizontal, 4)
            .background(R.color.nc17.color)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

