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
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                WatchListView()
                    .tabItem {
                        Image(systemName: "bookmark")
                            .environment(\.symbolVariants, .none)
                        Text("Watchlist")
                    }
                ProfileView(showSignInView: $showSignInView)
                    .tabItem {
                        Image(systemName: "person.circle")
                            .environment(\.symbolVariants, .none)
                        Text("Profile")
                    }
            }
            .toolbarBackground(Color("CSTab"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(Color("CSRed"))
    }
}

#Preview {
    MainTabView(showSignInView: .constant(false))
}
