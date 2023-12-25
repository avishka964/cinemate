//
//  HomeView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct HomeView: View {
    
    @State var selected: Int = 1
    var body: some View {
        
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
                        ForEach(1...5, id: \.self) { value in
                            CardView()
                        }
                    }
                }).frame(height: 300)
                //MARK: upcoming section
                Text("Upcoming")
                    .font(.custom(CustomFont.Roboto.bold, size: 20))
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(1...5, id: \.self) { value in
                            CardView()
                        }
                    }
                }).frame(height: 300)
                //MARK: genres section
                Text("Genres")
                    .font(.custom(CustomFont.Roboto.bold, size: 20))
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(1...5, id: \.self) { value in
                            GenreChipView()
                        }
                    }
                }).frame(height: 55)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    HomeView()
}
