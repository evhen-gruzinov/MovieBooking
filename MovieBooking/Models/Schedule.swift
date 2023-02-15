//
//  Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

struct Schedule: Hashable, Identifiable {
    let id: UUID = UUID()
    let date: Date
    let time: [String]
}
