//
//  GenreChipView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct GenreChipView: View {
    
    let padding: CGFloat
    let frameHeight: CGFloat
    let textColor: Color
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
            Text("Adventure").padding(padding).foregroundColor(textColor)
        }.frame(height: frameHeight)
    }
}

#Preview {
    GenreChipView(padding: 3, frameHeight: 55, textColor: .white)
}
