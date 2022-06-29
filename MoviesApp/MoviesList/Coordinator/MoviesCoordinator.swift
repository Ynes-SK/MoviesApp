//
//  MoviesCoordinator.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
import UIKit
protocol BackToFirstViewControllerDelegate: class {
    func navigateBackToFirstPage(newOrderCoordinator: MoviesCoordinator)
}

class MoviesCoordinator: Coordinator {
    /// childs for existing coordinators
     var childCoordinators: [Coordinator] = []
     let moviesViewModel: MoviesViewModel = MoviesViewModel()
    unowned let navigationController:UINavigationController
    
    weak var delegate: BackToFirstViewControllerDelegate?
    
    /// init navigationController
    /// - Parameter navigationController: navigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
   
    /// start navigation
    func start() {
        let moviesViewController : MoviesViewController = MoviesViewController()
        moviesViewController.delegate = self
        moviesViewController.moviesViewModel = moviesViewModel
        self.navigationController.pushViewController(moviesViewController, animated: true)
    }
}

extension MoviesCoordinator : MoviesViewControllerDelegate {
    func navigateToDetailsPage(result: MovieDetails) {
        let detailsView : MovieDetailViewController = MovieDetailViewController()
         detailsView.delegate = self
         detailsView.moviesDetails = result
         self.navigationController.pushViewController(detailsView, animated: true)
    }

    /// Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}
