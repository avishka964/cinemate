//
//  WatchListView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct WatchListView: View {
    
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
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(1...5, id: \.self) { movie in
                            NavigationLink(value: movie) {
//                                CardView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                })
                .padding(.top)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(for: Int.self) {movie in
                DetailsView()
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    WatchListView()
}
