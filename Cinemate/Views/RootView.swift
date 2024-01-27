//
//  RootView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-12.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
                NavigationStack {
                    MainTabView(showSignInView: $showSignInView)
                }
            }
        }.onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }.fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                SignInView(showSignInView: $showSignInView)
            }
        }
     
    }
}

#Preview {
    RootView()
}
