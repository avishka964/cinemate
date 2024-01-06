//
//  GenreView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct GenreView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @Binding var genreName: String
    @Binding var genreId: Int
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    var body: some View {
        VStack {
            //MARK: heading
            HeadingView(mainHeading: genreName.capitalized, subHeading: "Dive into Diversity: Navigate by Genres").padding(.top)
            //MARK: watchlist result
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.genresMovies, id: \.id) { movie in
                        CardView(title: movie.title, date: movie.releaseDate, posterPath: movie.posterPath ?? "")
                    }
                }.onAppear{
                    viewModel.fetchMoviesByGenres(genreId: genreId)
                }
            })
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GenreView(genreName: Binding.constant("animation"), genreId: Binding.constant(Int(16)))
}
