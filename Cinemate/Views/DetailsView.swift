//
//  DetailsView.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-17.
//

import SwiftUI
import AVKit

struct DetailsView: View {
    
    @StateObject private var viewModel = DetailsViewModel()
    
    @State var player = AVPlayer()
    let gradientEndPercentage: CGFloat = 0.3
    var videoUrl: String = "https://www.w3schools.com/html/mov_bbb.mp4"
    @Environment(\.dismiss) var dismiss
    
    //MARK: date formatter
    var formattedDate: String {
        let stringDate = viewModel.details?.releaseDate ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date_res = dateFormatter.date(from: stringDate) {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: date_res)
        } else {
            return "-"
        }
    }
    
    //MARK: time formatter
    var formattedTime: String {
        let totalMinutes = viewModel.details?.runtime ?? 0 
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        
        if hours > 0 && minutes > 0 {
            return "\(hours)h \(minutes)min"
        } else if hours > 0 {
            return "\(hours)h"
        } else if minutes > 0 {
            return "\(minutes)min"
        } else {
            return "0min"
        }
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //MARK: backdrop poster
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.details?.backdropPath ?? "")")) { phase in
                    switch phase {
                    case .empty:
                        Skeleton(cornerRadius: 0, width: 170, height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        VStack(alignment: .center) {
                            Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 200, height: 200)
                        }.frame(maxWidth: .infinity)
                    default:
                        VStack(alignment: .center) {
                            Image(systemName: "photo.fill").renderingMode(.original).font(.largeTitle).frame(width: 200, height: 200)
                        }.frame(maxWidth: .infinity)
                    }
                }
                
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
                        Text("\(formattedDate) - \(viewModel.details?.originalLanguage ?? "-")")
                            .font(.custom(CustomFont.Roboto.regular, size: 15))
                            .foregroundStyle(Color("CSGray"))
                        Text(viewModel.details?.originalTitle ?? "")
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
                        if let genres = viewModel.details?.genres {
                            LazyHStack {
                                ForEach(genres, id: \.id) { genre in
                                    GenreChipView(name: genre.name, padding: 3, frameHeight: 8, textColor: Color("CSGray"))
                                }
                            }
                        }
                        
                    }
                }).frame(height: 55)
                //MARK: movie overview
                VStack(alignment: .leading) {
                    Text("Overview")
                        .font(.custom(CustomFont.Roboto.bold, size: 15))
                        .padding(.top, 3)
                        .padding(.bottom, 2)
                    Text(viewModel.details?.overview ?? "")
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
                            Text(viewModel.details?.status ?? "-").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                        }.padding(10)
                    }.frame(height: 55)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 7.0).stroke(Color("CSBlack"), lineWidth: 2)
                        VStack{
                            Text("BUDGET").font(.custom(CustomFont.Roboto.bold, size: 16))
                            Text("$\(viewModel.details?.budget ?? 0) ").font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
                        }.padding(10)
                    }.frame(height: 55)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 7.0).stroke(Color("CSBlack"), lineWidth: 2)
                        VStack{
                            Text("RUNTIME").font(.custom(CustomFont.Roboto.bold, size: 16))
                            Text(formattedTime).font(.custom(CustomFont.Roboto.regular, size: 14)).foregroundStyle(Color("CSGray"))
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
        .onAppear {
            viewModel.fetchMovieDetails()
        }
    }
}

#Preview {
    DetailsView()
}
