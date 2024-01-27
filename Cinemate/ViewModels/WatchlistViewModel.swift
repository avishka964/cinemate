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
    @Published var isBookmarked: Bool = false
    
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
    
    func fetchWatchlist(userId: String) {
        db.collection("watchlist").whereField("user_id", isEqualTo: userId)
            .getDocuments { [weak self] (querySnapshot, error) in
                guard let self = self else {return}
                if let error = error {
                    print("Error fetching watchlist: \(error)")
                    return
                }
                if let documents = querySnapshot?.documents {
                    self.watchlist = documents.compactMap { documents in
                        do {
                            let my_watchlist = try documents.data(as: WatchlistDetails.self)
                            return my_watchlist
                        } catch {
                            print("Error decoding watchlist: \(error)")
                            return nil
                        }
                    }
                }
            }
    }
    
    func fetchMovie(userId: String, id: Int) {
        db.collection("watchlist")
            .whereField("user_id", isEqualTo: userId)
            .whereField("id", isEqualTo: id)
            .getDocuments { [weak self] (querySnapshot, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error fetching watchlist: \(error)")
                    return
                }
                if let documents = querySnapshot?.documents, !documents.isEmpty {
                    self.isBookmarked = true
                    print("true")
                } else {
                    self.isBookmarked = false
                    print("false")
                }
            }
    }
    
    func deleteMovie(userId: String, id: Int) {
        print("delete: \(userId)")
        print("delete: \(id)")

        db.collection("watchlist")
            .whereField("user_id", isEqualTo: userId)
            .whereField("id", isEqualTo: id)
            .getDocuments { [weak self] (querySnapshot, error) in
                guard let self = self, let documents = querySnapshot?.documents else { return }

                if let error = error {
                    print("Error fetching watchlist: \(error)")
                    return
                }

                for document in documents {
                    let documentID = document.documentID
                    self.db.collection("watchlist").document(documentID).delete { error in
                        if let error = error {
                            print("Error deleting movie: \(error)")
                        } else {
                            print("Movie successfully deleted")
                        }
                    }
                }
        }
    }

}
