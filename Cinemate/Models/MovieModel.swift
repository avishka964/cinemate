//
//  MovieModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import Foundation

struct Movie: Codable {
    let backdropPath: String?
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

struct MovieListResponse: Codable {
    let results: [Movie]
}
