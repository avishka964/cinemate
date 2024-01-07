//
//  VideoModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-07.
//

import Foundation

struct VideoDetails: Codable {
    let name: String
    let key: String
    let type: String
    let id: String
}

struct VideoResponse: Codable {
    let results: [VideoDetails]
}
