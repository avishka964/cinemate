//
//  GenreChipView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

struct GenreChipView: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
            Text("Adventure").padding()
        }.frame(height: 50)
    }
}

#Preview {
    GenreChipView()
}