//
//  TicketData.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import Foundation

struct TicketModel2: Identifiable {
    var id = UUID()
//    var id = UUID().uuidString
    var image: String
    var title: String
    var subtitle: String
    var top: String
    var bottom: String
}

var tickets: [TicketModel2] = [
    TicketModel2(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
    TicketModel2(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
    TicketModel2(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
]
