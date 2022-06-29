//
//  UIImageview.swift
//  MoviesApp
//
//  Created by Ines Sakly on 29/6/2022.
//
import UIKit
extension UIImageView {
    func loadFrom(path: String) {
        guard let url = URL(string: path) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
