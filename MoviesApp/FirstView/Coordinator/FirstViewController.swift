//
//  FirstViewController.swift
//  MoviesApp
//
//  Created by Ines Sakly on 27/6/2022.
//

import Foundation
import UIKit
public protocol FirstViewControllerDelegate: class {
    func goToMovies()
}
class FirstViewController: UIViewController {
    public weak var delegate: FirstViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstViewController"
    }
    @IBAction func goToMovies(_ sender: Any) {
        self.delegate?.goToMovies()
    }
    
}
