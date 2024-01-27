//
//  HomeView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State var selected: String = "day"
    @State private var isShowGeners: Bool = false
    @State private var genreName: String = ""
    @State private var genreId: Int = 0
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    //MARK: image carousel
                    ImageCarouselView()
                        .frame(height: 182)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                        )
                    //MARK: trending section
                    HStack(spacing: 20) {
                        Text("Trending")
                            .font(.custom(CustomFont.Roboto.bold, size: 20))
                        //MARK: picker
                        Picker(
                            selection: $selected,
                            label: Text("Picker"),
                            content: {
                                Text("TODAY").tag("day")
                                Text("WEEK").tag("week")
                            }).onChange(of: selected) { oldValue, newValue in
                                viewModel.trendingMovies = []
                                viewModel.fetchTrendingMovies(type: newValue)
                            }.pickerStyle(.segmented)
                    }
                    .padding(.vertical)
                    .frame(width: 250, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(viewModel.trendingMovies, id: \.id) { movie in
                                NavigationLink(value: movie.id) {
                                    CardView(title: movie.title, date: movie.releaseDate, posterPath: movie.posterPath ?? "")
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }.onAppear{
                            viewModel.fetchTrendingMovies(type: selected)
                        }
                    }).frame(height: 300)
                    //MARK: upcoming section
                    Text("Top Rated")
                        .font(.custom(CustomFont.Roboto.bold, size: 20))
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(viewModel.topMovies, id: \.id) { movie in
                                NavigationLink(value: movie.id) {
                                    CardView(title: movie.title, date: movie.releaseDate, posterPath: movie.posterPath ?? "")
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }.onAppear {
                            viewModel.fetchTopMovies()
                        }
                    }).frame(height: 300)
                    //MARK: genres section
                    Text("Genres")
                        .font(.custom(CustomFont.Roboto.bold, size: 20))
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(viewModel.genresList, id: \.id) { genre in
                                GenreChipView(name: genre.name, padding: 10, frameHeight: 55, textColor: Color(Color("CSBW"))).onTapGesture(perform: {
                                    genreName = genre.name
                                    genreId = genre.id
                                    isShowGeners.toggle()
                                })
                            }
                        }.onAppear {
                            viewModel.fetchGenres()
                        }
                    }).frame(height: 55)
                }
                .sheet(isPresented: $isShowGeners, content: {
                    GenreView(genreName: $genreName, genreId: $genreId)
                })
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.navigationDestination(for: Int.self) { movie in
                DetailsView(movieId: movie)
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    HomeView()
}
