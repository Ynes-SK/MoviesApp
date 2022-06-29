//
//  MoviesViewController.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
import UIKit
public protocol MoviesViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToDetailsPage(result: MovieDetails)
}
class MoviesViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: MoviesViewControllerDelegate?
    var moviesViewModel: MoviesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        moviesViewModel?.loadData(completion: {
            self.tableView.reloadData()
        })
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }
    //MARK: - Register cell
     func registerCell() {
        self.tableView.register(UINib(nibName: "MovieCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "MovieCell")
    }
}
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel?.movie?.results.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell {
            let result =  moviesViewModel?.movie?.results[indexPath.row]
            cell.title.text = result?.title
            cell.year.text = result?.release_date
            if let path = result?.backdrop_path{
                let coverUrlString = "https://image.tmdb.org/t/p/w500" + path
                cell.cover.loadFrom(path: coverUrlString)
            }
           
            return cell
        }
       return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let result =  moviesViewModel?.movie?.results[indexPath.row] {
            self.delegate?.navigateToDetailsPage(result: result)
        }
    }
}
