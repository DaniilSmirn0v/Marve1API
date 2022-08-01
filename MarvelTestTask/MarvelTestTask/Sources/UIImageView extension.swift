//
//  UIImageView extension.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        
            self.kf.setImage(with: ImageResource(downloadURL: imageURL))
        
        
    }
}
