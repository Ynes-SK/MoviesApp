//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
public struct MovieDetails: Codable, Identifiable {
    public var adult: Bool
    public var backdrop_path: String
    public var genre_ids: [Int]
    public var id: Int
    public var original_language: String
    public var original_title: String
    public var overview: String
    public var popularity: Float
    public var poster_path: String
    public var release_date: String
    public var title: String
    public var video: Bool
    public var vote_average: Float
    public var vote_count: Float
    enum CodingKeys: CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case id
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case release_date
        case title
        case video
        case vote_average
        case vote_count
    }
}
