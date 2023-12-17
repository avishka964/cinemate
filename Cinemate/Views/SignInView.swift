//
//  SignInView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-16.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Image("signin")
                .resizable()
            Rectangle()
                .mask(
                    LinearGradient(gradient: Gradient(colors: [Color.black, .clear]), startPoint: .bottom, endPoint: .top))
            
            VStack(alignment: .leading){
                Spacer()
                
                Text("Welcome to the \nCinemate")
                    .font(.custom(CustomFont.Roboto.bold, size: 40))
                    .foregroundStyle(.white)
                
                //MARK: Google SSO button
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignInView = false
                            print("Login success")
                        } catch {
                            print(error)
                        }
                    }
                }, label: {
                    HStack(spacing: 20) {
                        Image("google-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                        
                        Text("Continue with Google")
                            .font(.custom(CustomFont.Roboto.medium, size: 20))
                            .foregroundStyle(.black)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.bottom)
                
                HStack(alignment: .center) {
                    Group {
                        Text("Privacy Policy ").foregroundStyle(Color("CSRed")) +
                        Text("and ") +
                        Text("Terms of Service").foregroundStyle(Color("CSRed"))
                    }
                    .font(.custom(CustomFont.Roboto.medium, size: 13))
                    .foregroundStyle(.white)
                }.frame(maxWidth: .infinity)

            }
            .padding(.horizontal)
            .padding(.bottom, 35)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView(showSignInView: .constant(false))
}
