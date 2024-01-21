//
//  ProfileViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: Users? = nil
    
    func loadCurrrnetUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManagerModel.shared.getUser(userId: authDataResult.uid)
    }
    
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
