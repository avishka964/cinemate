//
//  CreditsModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-07.
//

import Foundation

struct CreditsDetails: Codable {
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let profilePath: String?
    let character: String
    
    private enum CodingKeys: String, CodingKey {
        case gender
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case profilePath = "profile_path"
        case character
    }

}

struct CreditsResponse: Codable {
    let cast: [CreditsDetails]
}
