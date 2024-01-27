//
//  UserViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-27.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManagerModel {
    
    static let shared = UserManagerModel()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func createNewUser(user: Users) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> Users {
        try await userDocument(userId: userId).getDocument(as: Users.self, decoder: decoder)
    }
    
}
