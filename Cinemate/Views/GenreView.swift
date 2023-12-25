//
//  GenreView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct GenreView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    var body: some View {
        VStack {
            //MARK: heading
            HeadingView(mainHeading: "Action", subHeading: "Dive into Diversity: Navigate by Genres").padding(.top)
            //MARK: watchlist result
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1...5, id: \.self) { value in
                        CardView()
                    }
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
    GenreView()
}
