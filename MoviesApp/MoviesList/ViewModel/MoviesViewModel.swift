//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
import NetworkingManager
class MoviesViewModel {
    var movie: Movie?
    func loadData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3") else { fatalError("Invalid URL") }
        NetworkingManager().request(fromURL: url, httpMethod: .get) { (result: Result<Movie, Error>) in
            switch result {
            case .success(let movieData):
                 self.movie = movieData
                 completion()
            case .failure(let error):
                debugPrint("failure trying to get the movies: \(error)")
        }
        }
    }

}
