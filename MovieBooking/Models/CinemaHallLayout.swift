//
// Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

struct CinemaHallLayout {
    let title: String
    var rows: [Row]
    
    init(title: String) {
        self.title = title
        self.rows = []
    }
    
    mutating func addRows(count: Int, structure: RowStructure) {
        var nowRows = self.rows
        var nowIndex = nowRows.count
        for _ in 1...count {
            nowIndex += 1
            
            var seats: [Seat] = []
            for seatIndex in 1...structure.seatsCount {
                seats.append(Seat(index: seatIndex, row: nowIndex))
            }
            
            let appendingRow = Row(index: nowIndex, seats: seats, type: structure.type)
            
            nowRows.append(appendingRow)
        }
        self.rows = nowRows
    }
}

struct Seat: Hashable {
    let id: UUID = UUID()
    let index: Int
    let row: Int
    let isBooked: Bool = false
    var isSelected: Bool = false
}

struct Row: Hashable {
    let index: Int
    var seats: [Seat]
    let type: RowType
}

struct RowStructure: Hashable {
    let seatsCount: Int
    let leadingMargin: Int
    let trailingMargin: Int
    let type: RowType
}

enum RowType {
    case standart
    case vip
}
