//
//  AlertController extension.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 03.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        if actions.isEmpty {
            let defaultAction = UIAlertAction(title: "Oke", style: .default)
            alertController.addAction(defaultAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showImageAlert(title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let image = UIImage(named: "notInfo")
        let imageView = UIImageView(image: image)
        
        alertController.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        alertController.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alertController.view, attribute: .centerX, multiplier: 1, constant: .zero))
        
        alertController.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: alertController.view, attribute: .centerY, multiplier: 1, constant: .zero))
        
        alertController.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
        
        alertController.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44))
        
        for action in actions {
            alertController.addAction(action)
        }
        
        if actions.isEmpty {
            let defaultAction = UIAlertAction(title: "Oke", style: .default)
            alertController.addAction(defaultAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
