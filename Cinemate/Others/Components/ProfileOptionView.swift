//
//  ProfileOptionView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-26.
//

import SwiftUI

struct ProfileOptionView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
//            Divider()
        }
    }
}

#Preview {
    ProfileOptionView(imageName: "person.circle", title: "Edit Profile")
}
