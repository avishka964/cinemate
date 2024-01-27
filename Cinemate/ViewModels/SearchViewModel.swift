//
//  SearchViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-06.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchMovies: [Movie] = []
    @Published var searchName = ""
    
    //MARK: fetch search movies
    func fetchSearchMovies() {
        print("name: \(searchName)")
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(searchName)")!
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
                    let decodedData = try decoder.decode(MovieListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.searchMovies = decodedData.results
                    }
                } catch let error as DecodingError {
                    print("Decoding Error: \(error)")
                } catch {
                    print("Decoding Error: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
    
}
