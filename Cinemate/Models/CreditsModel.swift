//
//  CreditsModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-07.
//

import Foundation

struct CreditsDetails: Codable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let character: String
    let order: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case gender
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character
        case order
    }

}

struct CreditsResponse: Codable {
    let cast: [CreditsDetails]
}
