//
//  CastCardView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-26.
//

import SwiftUI

struct CastCardView: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
            VStack {
                Image("cp")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("Cillian Murphy").font(.custom(CustomFont.Roboto.regular, size: 16))
                    Text("J. Robert Oppenheimer").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray")).multilineTextAlignment(.leading)
                }.padding().frame(maxWidth: .infinity, alignment: .leading)
            }
        }.frame(width: 150, height: 220)
    }
}

#Preview {
    CastCardView()
}
