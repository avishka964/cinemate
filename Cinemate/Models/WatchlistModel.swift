//
//  WatchlistModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-21.
//

import Foundation

struct WatchlistDetails: Codable {
    let id: Int
    let userId: String
    let originalTitle: String
    let posterPath: String
    let releaseDate: String
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }

}

