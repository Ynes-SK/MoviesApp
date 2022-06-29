//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var year: UILabel!
    @IBOutlet var cover: UIImageView!
    var movieItem: MovieDetails?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
