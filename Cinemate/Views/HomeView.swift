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
            Text("Home").foregroundStyle(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black)
    }
}

#Preview {
    HomeView()
}
