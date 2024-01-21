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
    
    private var db = Firestore.firestore()
    
    
    func addMovie(id: Int, originalTitle: String, posterPath: String, releaseDate: String, title: String) {
        let newMovie = WatchlistDetails(
            id: id,
            userId: "",
            originalTitle: originalTitle,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title
        )
        
        print(newMovie)
        
        
    }
}
