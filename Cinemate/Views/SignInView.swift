//
//  SignInView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-16.
//

import SwiftUI



struct SignInView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    
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
                            //redirect
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
                
                Group {
                    Text("Don’t have an account? ") +
                    Text("Sign up").bold().foregroundStyle(Color("CSRed"))
                }
                .font(.custom(CustomFont.Roboto.medium, size: 15))
                .foregroundStyle(.white)
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
    SignInView()
}
