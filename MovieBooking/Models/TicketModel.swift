//
//  Created by Evhen Gruzinov on 25.02.2023.
//

import Foundation

struct Ticket: Identifiable, Codable {
    var id: String = UUID().uuidString
    var globalID: UUID = UUID()
    let movieID: Int
    let date: Date
    let time: String
    let row: Int
    let seats: [Int]
}
