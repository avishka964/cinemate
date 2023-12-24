//
//  HomeView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            
            //MARK: image carousel
            ImageCarouselView()
                .frame(height: 182)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                )
            
            //MARK: trending section
            HStack {
                Text("Trending")
                    .font(.custom(CustomFont.Roboto.bold, size: 20))
                    .foregroundStyle(.white)
                
                Text("helo")
                    .font(.custom(CustomFont.Roboto.medium, size: 20))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    HomeView()
}
