//
// Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

struct CinemaHall {
    let title: String
    let seats: [Row]
}

func setRows(count: Int, structure: Row) -> [Row] {
    var returning: [Row] = []
    for _ in 1...count {
        returning.append(structure)
    }
    return returning
}

struct Row {
    let seatsCount: Int
    let leadingMargin: Int
    let trailingMargin: Int
    let type: RowType
}

enum RowType {
    case standart
    case vip
}
