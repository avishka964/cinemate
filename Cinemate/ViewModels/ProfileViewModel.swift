//
//  ProfileViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    func signOut() throws {
           try AuthenticationManager.shared.signOut()
    }
}
