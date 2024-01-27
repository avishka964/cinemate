//
//  WatchlistViewModel.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2024-01-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class WatchlistViewModel: ObservableObject {
    
    @Published var watchlist: [WatchlistDetails] = []
    private var db = Firestore.firestore()
    
    func addMovie(id: Int, userId: String, originalTitle: String, posterPath: String, releaseDate: String, title: String) {
        let newMovie = WatchlistDetails(
            id: id,
            userId: userId,
            originalTitle: originalTitle,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title
        )
        do {
            try db.collection("watchlist").addDocument(from: newMovie) { error in
                if let error = error {
                    print("Error adding movie: \(error)")
                } else {
                    print("movie added successfully!")
                }
            }
        } catch {
            print("Error encoding movie: \(error)")
        }
    }
    
    func fetchMovie(userId: String) {
        print("fetch: \(userId)")
        db.collection("watchlist").whereField("user_id", isEqualTo: userId).getDocuments {(querySnapshot, error) in
            if let error = error {
                print("Error fetching watchlist: \(error)")
                return
            }
            if let documents = querySnapshot?.documents {
                self.watchlist = documents.compactMap { documents in
                    do {
                        let my_watchlist = try documents.data(as: WatchlistDetails.self)
                        print("Decoded watchlist: \(my_watchlist)")
                        return my_watchlist
                    } catch {
                        print("Error decoding watchlist: \(error)")
                        return nil
                    }
                }
            }
        }
    }
}
