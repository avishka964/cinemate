//
//  AuthenticationViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import Foundation


@MainActor
final class AuthViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        let helper = SignInGooogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        let user = Users(auth: authDataResult)
        print(user)
        try await UserManagerModel.shared.createNewUser(user: user)
    }
}
