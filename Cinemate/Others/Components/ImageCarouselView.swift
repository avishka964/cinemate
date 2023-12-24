//
//  ImageCarouselView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-24.
//

import SwiftUI

struct ImageCarouselView: View {
    
    var images = [
        "landscape-1",
        "landscape-2",
        "landscape-3",
        "landscape-4"
    ]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ImageCarouselView()
}
