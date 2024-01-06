//
//  HomeViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var topMovies: [Movie] = []
    @Published var genresList: [Genre] = []
    @Published var genresMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    
    //MARK: fetch top rated movies
    func fetchTopMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated")!
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
                        self.topMovies = decodedData.results
                    }
//                    print("top_rated res: \(decodedData.results)")
                } catch {
                    DispatchQueue.main.async {
                        print("Decoding Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //MARK: fetch genres
    func fetchGenres() {
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list")!
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
                    let decodedData = try decoder.decode(GenresResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.genresList = decodedData.genres
                    }
//                    print("genres res: \(decodedData.genres)")
                } catch {
                    DispatchQueue.main.async {
                        print("Decoding Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask.resume()
    }
    //MARK: fetch movies by genres
    func fetchMoviesByGenres(genreId: Int) {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?with_genres=\(genreId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": Secrets.accessToken ]
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
                        self.genresMovies = decodedData.results
                    }
//                    print("movies by genres res: \(decodedData.results)")
                } catch {
                    DispatchQueue.main.async {
                        print("Decoding Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask.resume()
    }
    //MARK: fetch movies by genres
    func fetchTrendingMovies(type: String) {
        print("type \(type)")
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/\(type)")!
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
                        self.trendingMovies = decodedData.results
                    }
//                    print("trending movies res: \(decodedData.results)")
                } catch {
                    DispatchQueue.main.async {
                        print("Decoding Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}

