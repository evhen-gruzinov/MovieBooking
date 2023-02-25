//
// Created by Evhen Gruzinov on 15.02.2023.
//

import Foundation

struct Movie: Hashable, Identifiable, Codable {
    var id: UUID = UUID()
    let movieId: Int
    let title: String
    let subtitle: String
    let description: String
    let poster: String
    let image: String
    let status: MovieStatus
    let schedule: [Schedule]?
}

func getMovieFrom(id: Int, movies: [Movie]) -> Movie? {
    for movie in movies {
        if movie.movieId == id {
            return movie
        }
    }
    return nil
}

enum MovieStatus: Codable {
    case available
    case coming
    case over
}
