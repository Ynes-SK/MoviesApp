//
//  Coordinator.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import UIKit
public protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}
