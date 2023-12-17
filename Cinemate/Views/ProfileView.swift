//
//  ProfileView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        Button {
            Task {
                do {
                    try viewModel.signOut()
                    showSignInView = true
                } catch {
                    print(error)
                }
            }
        } label: {
            Text("Log out")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ProfileView(showSignInView: .constant(false))
}
