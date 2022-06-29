//
//  FirstCoordinator.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
import UIKit
class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    //stard navigation
    func start() {
        let firstViewController : FirstViewController = FirstViewController()
        firstViewController.delegate = self
        custumizeNavigationBar()
        self.navigationController.pushViewController(firstViewController, animated: true)
    }
    func custumizeNavigationBar(){
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().barTintColor = .black
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}

extension FirstCoordinator: FirstViewControllerDelegate {

    // Navigate to movies page
    func goToMovies() {
       let secondCoordinator = MoviesCoordinator(navigationController: navigationController)
       secondCoordinator.delegate = self
       childCoordinators.append(secondCoordinator)
       secondCoordinator.start()
    }
}

extension FirstCoordinator: BackToFirstViewControllerDelegate {
    
    // Back from movies list page
    func navigateBackToFirstPage(newOrderCoordinator: MoviesCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}
