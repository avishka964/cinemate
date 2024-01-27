//
//  CastCardView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-26.
//

import SwiftUI

struct CastCardView: View {
    
    let name: String
    let character: String
    let profilePath: String
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")) { phase in
                    switch phase {
                    case .empty:
                        Skeleton(cornerRadius: 50, width: 100, height: 100)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 100, height: 100)
                    default:
                        Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 100, height: 100)
                    }
                }
                VStack(alignment: .leading){
                    Text(name).font(.custom(CustomFont.Roboto.regular, size: 16))
                    Text(character).font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                }.padding().frame(width: 140, height: 110, alignment: .leading)
            }
        }.frame(width: 150, height: 240)
        
    }
}

#Preview {
    CastCardView(name: "Cillian Murphy", character: "J. Robert Oppenheimer", profilePath: "/dm6V24NjjvjMiCtbMkc8Y2WPm2e.jpg")
}
