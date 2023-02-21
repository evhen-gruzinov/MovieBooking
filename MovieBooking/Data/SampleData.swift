//
// Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

private let sampleDate1 = getDate(string: "15.01.2023")!
private let sampleDate2 = getDate(string: "16.01.2023")!

var sampleMovies = [
    Movie(title: "Thor", subtitle: "Love and Thunder", description: "Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct.", poster: "poster_thor", image: "img_thor", status: .available, schedule: [
            Schedule(date: sampleDate1, time: ["15:00", "20:30"]),
            Schedule(date: sampleDate2, time: ["11:00", "16:00", "19:20"])
            ]),
    Movie(title: "Black Panther", subtitle: "Wakanda Forever", description: "The people of Wakanda fight to protect their home from intervening world powers as they mourn the death of King T'Challa.", poster: "poster_panther", image: "img_panther", status: .available, schedule: nil),
    Movie(title: "Doctor Strange", subtitle: "in the Multiverse of Madness", description: "Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse. They seek help from Wanda the Scarlet Witch, Wong and others.", poster: "poster_scarlet", image: "img_scarlet", status: .available, schedule: nil),
    Movie(title: "The Last of Us", subtitle: "Endure And Survive.", description: "After a global pandemic destroys civilization, a hardened survivor takes charge of a 14-year-old girl who may be humanity's last hope.", poster: "poster_tlou", image: "img_tlou", status: .coming, schedule: nil),
    Movie(title: "Avatar", subtitle: "The Way of Water", description: "Jake Sully lives with his newfound family formed on the extrasolar moon Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na'vi race to protect their home.", poster: "poster_avatar", image: "img_avatar", status: .coming, schedule: nil)
]

var sampleSeatsLayout: CinemaHallLayout {
    var seats = CinemaHallLayout(title: "Aquamarine")
    seats.addRows(count: 7, structure: RowStructure(seatsCount: 10, leadingMargin: 0, trailingMargin: 0, type: .standart))
    return seats
}
