//
// Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

struct CinemaHallLayout {
    let title: String
    var rows: [Row]
    
    init(title: String) {
        self.title = title
        rows = []
    }
    
    mutating func addRows(count: Int, structure: RowStructure) {
        var nowRows = rows
        var nowIndex = nowRows.count
        for _ in 1...count {
            nowIndex += 1
            
            var seats: [Seat] = []
            
            if structure.leadingMargin > 0 {
                for _ in 1...structure.leadingMargin {
                    seats.append(Seat(index: 0, row: nowIndex, type: structure.type, isMargin: true))
                }
            }
            
            for seatIndex in 1...structure.seatsCount {
                seats.append(Seat(index: seatIndex, row: nowIndex, type: structure.type, isMargin: false))
            }
            
            if structure.trailingMargin > 0 {
                for _ in 1...structure.trailingMargin {
                    seats.append(Seat(index: 0, row: nowIndex, type: structure.type, isMargin: true))
                }
            }
            
            let appendingRow = Row(index: nowIndex, seats: seats, type: structure.type)
            
            nowRows.append(appendingRow)
        }
        rows = nowRows
    }
}

struct Seat: Hashable {
    let id: UUID = UUID()
    let index: Int
    let row: Int
    let type: RowType
    let isBooked: Bool = false
    var isSelected: Bool = false
    let isMargin: Bool
}

struct Row: Hashable {
    let index: Int
    var seats: [Seat]
//    let leadingMargin: Int
//    let trailingMargin: Int
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
