//
//  WatchListView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct WatchListView: View {
    
    @StateObject private var viewModel = WatchlistViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                //MARK: heading
                HeadingView(mainHeading: "Watchlist", subHeading: "Build Your Playlist: Save and Enjoy")
                //MARK: watchlist result
                if profileViewModel.isHaveUser {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.watchlist, id: \.id) { movie in
                                NavigationLink(value: movie.id) {
                                    CardView(title: movie.title, date: movie.releaseDate, posterPath: movie.posterPath)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    })
                    .padding(.top)
                    .onAppear {
                        fetchWatchlist()
                    }
                }
                Spacer()
            }.task {
                try? await profileViewModel.loadCurrrnetUser()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(for: Int.self) { movie in
                DetailsView(movieId: movie)
                .navigationBarBackButtonHidden()
            }
        }
    }
    
    func fetchWatchlist() {
        viewModel.fetchMovie(userId: profileViewModel.user?.userId ?? "")
    }
}

#Preview {
    WatchListView()
}
