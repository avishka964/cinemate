//
//  MainTabView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house")}
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass")}
            WatchListView()
                .tabItem { Label("Search", systemImage: "bookmark")}
            ProfileView(showSignInView: $showSignInView)
                .tabItem { Label("Profile", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView(showSignInView: .constant(false))
}
