//
//  GenreModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-30.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
}

struct GenresResponse: Codable {
    let genres: [Genre]
}
