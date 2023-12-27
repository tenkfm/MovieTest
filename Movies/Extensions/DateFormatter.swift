//
//  Date.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 27/12/2023.
//

import Foundation

extension DateFormatter {
    static var yyMMdd: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }

    static var yyyy: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }
}
