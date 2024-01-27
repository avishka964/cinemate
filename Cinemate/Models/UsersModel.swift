//
//  UserManagerModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import Foundation

struct Users: Codable {
    let userId: String
    let name: String?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.name = auth.name
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
    }
    
    init(
        userId: String,
        name: String? = nil,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.userId = userId
        self.name = name
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
    }
    
}
