//
//  DetailsView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI
import AVKit

struct DetailsView: View {
    
    @State var player = AVPlayer()
    let gradientEndPercentage: CGFloat = 0.3
    var videoUrl: String = "https://www.w3schools.com/html/mov_bbb.mp4"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            //MARK: backdrop poster
            ZStack(alignment: .topLeading) {
                Image("landscape-3")
                    .resizable()
                    .scaledToFit()
                LinearGradient(gradient: Gradient(colors: [Color("CSFog"), Color.clear]), startPoint: .bottom, endPoint: UnitPoint(x: 0.5, y: gradientEndPercentage))
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.top, 52)
                        .padding(.leading, 32)
                }
            }
            VStack {
                //MARK: movie title and bookmark
                HStack{
                    VStack(alignment: .leading) {
                        Text("July 19, 2023 - en")
                            .font(.custom(CustomFont.Roboto.regular, size: 15))
                            .foregroundStyle(Color("CSGray"))
                        Text("Oppenheimer")
                            .font(.custom(CustomFont.Roboto.bold, size: 20))
                            .padding(.top, 0.5)
                    }
                    Spacer()
                    Button(action: {
                        print("Circular Button tapped")
                    }) {
                        Image(systemName: "bookmark")
                    }
                    .padding(10)
                    .foregroundColor(.red)
                }
                //MARK: genres chips
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(1...3, id: \.self) { genre in
                            GenreChipView(padding: 5, frameHeight: 15, textColor: Color("CSGray"))
                        }
                    }
                }).frame(height: 55)
                //MARK: movie overview
                VStack(alignment: .leading) {
                    Text("Overview")
                        .font(.custom(CustomFont.Roboto.bold, size: 15))
                        .padding(.top, 3)
                        .padding(.bottom, 2)
                    Text("The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.")
                        .multilineTextAlignment(.leading)
                        .font(.custom(CustomFont.Roboto.regular, size: 13))
                        .foregroundStyle(Color("CSGray"))
                }
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
                //MARK: movie video
                let url = URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .frame(height: 200)
                        .cornerRadius(10)
                }
                //MARK: movie overview
                HStack {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 7.0).stroke(Color("CSBlack"), lineWidth: 2)
                        VStack{
                            Text("STATUS").font(.custom(CustomFont.Roboto.bold, size: 16))
                            Text("Released").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                        }.padding(10)
                    }.frame(height: 55)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 7.0).stroke(Color("CSBlack"), lineWidth: 2)
                        VStack{
                            Text("BUDGET").font(.custom(CustomFont.Roboto.bold, size: 16))
                            Text("$100,000,000.00").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                        }.padding(10)
                    }.frame(height: 55)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 7.0).stroke(Color("CSBlack"), lineWidth: 2)
                        VStack{
                            Text("RUNTIME").font(.custom(CustomFont.Roboto.bold, size: 16))
                            Text("3h 1min").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                        }.padding(10)
                    }.frame(height: 55)
                }
                .padding(.vertical)
                //MARK: cast
                Text("Cast")
                    .font(.custom(CustomFont.Roboto.bold, size: 15))
                    .padding(.bottom, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(1...3, id: \.self) { genre in
                            CastCardView()
                        }
                    }
                })
            }
            .padding(.horizontal)
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailsView()
}
