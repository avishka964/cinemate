//
//  DetailsViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-06.
//

import Foundation


class DetailsViewModel: ObservableObject {
    @Published var details: MovieDetail?
    @Published var cast: [CreditsDetails] = []
    @Published var isFetchDetails: Bool = false
    @Published var videoKey: String = ""
    
    //MARK: fetch details of movies
    func fetchMovieDetails(movieId: Int) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?append_to_response=videos")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": Secrets.accessToken
        ]
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            if let data = data {
//                let jsonString = String(data: data, encoding: .utf8)
//                print("JSON Response: \(jsonString ?? "")")
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MovieDetail.self, from: data)
                    let filterdVideo = decodedData.videos?.results.filter {$0.type == "Trailer"}
                    DispatchQueue.main.async {
                        self.details = decodedData
                        self.isFetchDetails = true
                        self.videoKey = filterdVideo?[0].key ?? ""
                    }
//                    print("details res: \(filterdVideo?[0].key ?? "")")
                } catch let error as DecodingError {
                    print("Decoding Error: \(error)")
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
    //MARK: credits details
    func fetchCreditsDetails(movieId: Int) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": Secrets.accessToken
        ]
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    print("Error: \(error.localizedDescription)")
                }
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(CreditsResponse.self, from: data)
                    let filterdCast = decodedData.cast.filter {$0.knownForDepartment == "Acting"}
                    DispatchQueue.main.async {
                        self.cast = filterdCast
                    }
//                    print("credits res: \(decodedData)")
                } catch let error as DecodingError {
                    print("Decoding Error: \(error)")
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
}
