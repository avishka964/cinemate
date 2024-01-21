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
        ScrollView {
            VStack {
                //MARK: heading
                HeadingView(mainHeading: "Profile", subHeading: "Behind the Screens: Your Movie Profile")
                
                VStack {
                    Image("cp")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.vertical)
                    Text("Mark Brown").font(.custom(CustomFont.Roboto.regular, size: 16))
                        .padding(.bottom, 1)
                    if let user = viewModel.user {
                        Text(user.email ?? "").font(.custom(CustomFont.Roboto.regular, size: 14)).tint(Color("CSGray"))
                    }
                }.task {
                    try? await viewModel.loadCurrrnetUser()
                }
                //MARK: options
                ZStack {
                    RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
                    VStack(spacing: 24) {
                        ProfileOptionView(imageName: "person.circle", title: "Edit Profile")
                        ProfileOptionView(imageName: "creditcard", title: "Payment Method")
                    }.padding()
                }.padding(.top)
                ZStack {
                    RoundedRectangle(cornerRadius: 7.0).fill(Color("CSBlack"))
                    VStack(spacing: 24) {
                        ProfileOptionView(imageName: "questionmark.circle", title: "Support")
                        ProfileOptionView(imageName: "lock.shield", title: "Privacy Policy")
                        ProfileOptionView(imageName: "bell.fill", title: "Notification")
                    }.padding()
                }.padding(.top)
                //MARK: logout button
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
                        .frame(width: 360, height: 40)
                        .background(Color("CSRed"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

#Preview {
    ProfileView(showSignInView: .constant(false))
}
