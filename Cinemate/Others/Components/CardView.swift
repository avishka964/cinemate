//
//  CardView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("landscape-3")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            VStack(alignment: .leading) {
                Text("Avatar").font(.custom(CustomFont.Roboto.medium, size: 20))
                Text("December 14, 2022").font(.custom(CustomFont.Roboto.regular, size: 15))
            }.padding()
        }
        .background(Color("CSBlack"))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    CardView()
}
