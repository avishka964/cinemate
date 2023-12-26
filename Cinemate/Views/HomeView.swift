//
//  HomeView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct HomeView: View {
    
    @State var selected: Int = 1
    @State private var isShowGeners: Bool = false
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
                                Text("TODAY").tag(1)
                                Text("WEEK").tag(2)
                            }).pickerStyle(.segmented)
                    }
                    .padding(.vertical)
                    .frame(width: 250, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(1...5, id: \.self) { movie in
                                NavigationLink(value: movie) {
                                    CardView()
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }).frame(height: 300)
                    //MARK: upcoming section
                    Text("Upcoming")
                        .font(.custom(CustomFont.Roboto.bold, size: 20))
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(1...5, id: \.self) { movie in
                                NavigationLink(value: movie) {
                                    CardView()
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }).frame(height: 300)
                    //MARK: genres section
                    Text("Genres")
                        .font(.custom(CustomFont.Roboto.bold, size: 20))
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(1...5, id: \.self) { genre in
                                GenreChipView(padding: 10, frameHeight: 55, textColor: Color(Color("CSBW"))).onTapGesture(perform: {
                                    isShowGeners.toggle()
                                })
                            }
                        }
                    }).frame(height: 55)
                }
                .sheet(isPresented: $isShowGeners, content: {
                    GenreView()
                })
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.navigationDestination(for: Int.self) { movie in
                DetailsView()
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    HomeView()
}
