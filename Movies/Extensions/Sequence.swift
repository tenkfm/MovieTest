//
//  Sequence.swift
//  Movies
//
//  Created by Anton Rogachevskyi on 27/12/2023.
//

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
