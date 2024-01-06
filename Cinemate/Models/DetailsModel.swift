//
//  DetailsModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-06.
//

import Foundation

struct MovieDetail: Codable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: Collection?
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    struct Collection: Codable {
        let id: Int
        let name: String
        let posterPath: String?
        let backdropPath: String?
    }

    struct Genre: Codable {
        let id: Int
        let name: String
    }

    struct ProductionCompany: Codable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String?
    }

    struct ProductionCountry: Codable {
        let iso_3166_1: String
        let name: String
    }

    struct SpokenLanguage: Codable {
        let englishName: String?
        let iso_639_1: String
        let name: String
    }

    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
