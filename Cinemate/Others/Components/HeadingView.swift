//
//  HeadingView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct HeadingView: View {
    
    let mainHeading: String
    let subHeading: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mainHeading)
                .font(.custom(CustomFont.Roboto.bold, size: 30))
            Text(subHeading)
                .font(.custom(CustomFont.Roboto.medium, size: 20))
                .foregroundStyle(Color("CSGray"))
        }.padding(.bottom).frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeadingView(mainHeading: "Heading", subHeading: "This is the sub heading")
}
