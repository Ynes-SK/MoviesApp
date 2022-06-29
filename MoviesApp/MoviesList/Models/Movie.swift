//
//  Movie.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
struct Movie: Codable {
    var page: Int
    var results: [MovieDetails]
    enum CodingKeys: CodingKey {
        case page
        case results
    }
}
