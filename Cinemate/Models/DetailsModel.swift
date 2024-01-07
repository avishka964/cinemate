//
//  DetailsModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-06.
//

import Foundation

struct MovieDetail: Codable {
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String
    let revenue: Int?
    let runtime: Int
    let status: String
    let title: String
    let voteAverage: Double?
    let voteCount: Int?

    struct Genre: Codable {
        let id: Int
        let name: String
    }

    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case status
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
