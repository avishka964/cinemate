//
//  DetailsViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-06.
//

import Foundation


class DetailsViewModel: ObservableObject {
    @Published var details: MovieDetail?
    
    //MARK: fetch details of movies
    func fetchMovieDetails() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/278")!
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
                    let decodedData = try decoder.decode(MovieDetail.self, from: data)
                    DispatchQueue.main.async {
                        self.details = decodedData
                    }
//                    print("details res: \(decodedData)")
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
