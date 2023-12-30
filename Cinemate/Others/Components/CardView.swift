//
//  CardView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct CardView: View {
    let title: String
    let date: String
    let posterPath: String
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date_res = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: date_res)
        } else {
            return "Invalid Date"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)"), scale: 3) { phase in
                switch phase {
                case .empty:
                    Skeleton(cornerRadius: 0, width: 170, height: 200)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 200)
                        .padding(.bottom)
                case .failure:
                    Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 170, height: 200)
                        .padding(.bottom)
                default:
                    Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 170, height: 200)
                        .padding(.bottom)
                }
            }
            VStack(alignment: .leading) {
                Text(title).lineLimit(1).font(.custom(CustomFont.Roboto.medium, size: 20))
                Text(formattedDate).font(.custom(CustomFont.Roboto.regular, size: 15))
            }.padding().frame(width: 170)
        }
        .background(Color("CSBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    CardView(title: "Title", date: "2023-12-30", posterPath: "/bkpPTZUdq31UGDovmszsg2CchiI.jpg")
}
