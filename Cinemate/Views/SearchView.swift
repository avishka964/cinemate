//
//  SearchView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                //MARK: heading
                HeadingView(mainHeading: "Search", subHeading: "Find Your Film: Search and Explore")
                //MARK: search field
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search movie", text: $searchText)
                        .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.5)
                        .foregroundStyle(Color("CSGray"))
                }
                //MARK: search results
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(1...5, id: \.self) { movie in
                            NavigationLink(value: movie) {
                                CardView()
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
            .navigationDestination(for: Int.self) { movie in
                DetailsView()
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    SearchView()
}
