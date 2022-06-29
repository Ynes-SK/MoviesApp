//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Ines Sakly on 28/6/2022.
//

import Foundation
import UIKit
class MovieDetailViewController: UIViewController {
    @IBOutlet var cover: UIImageView!
    @IBOutlet var titleLbael: UILabel!
    @IBOutlet var year: UILabel!
    @IBOutlet var descriptin: UILabel!

    public weak var delegate: MoviesViewControllerDelegate?
    var moviesDetails: MovieDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie's Details"
        titleLbael.text = moviesDetails?.title
        year.text = moviesDetails?.release_date
        descriptin.text = moviesDetails?.overview
        if let path = moviesDetails?.backdrop_path{
            let coverUrlString = "https://image.tmdb.org/t/p/w500" + path
            cover.loadFrom(path: coverUrlString)
        }
        print("id: ", moviesDetails?.id)
        print("picture: ", moviesDetails?.backdrop_path)
    }
  
}
