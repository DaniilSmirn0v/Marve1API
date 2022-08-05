//
//  Thumbnail.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 05.08.2022.
//

import UIKit

enum SizeImage: String {
    case meium = "standard_medium"
    case large = "landscape_large"
    case portraitMedium = "portrait_medium"
}


struct Thumbnail: Decodable {
    private let path: String?
    private let format: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case format = "extension"
    }
    
    var mediumImage: UIImage? {
        getImage(size: SizeImage.meium.rawValue)
    }
    
    var largeImage: UIImage? {
        getImage(size: SizeImage.large.rawValue)
    }
    
    var portraitMedium: UIImage? {
        getImage(size: SizeImage.portraitMedium.rawValue)
    }
    
    private func getImage(size: String) -> UIImage? {
        guard let imagePath = path,
              let imageExtension = format,
              let imageURL = URL(string: "\(imagePath)/\(size).\(imageExtension)")
        else {
            return nil }
        
        if imagePath.contains("image_not_available") {
            return UIImage(named: "tony")
        } else {
            
            guard let data = try? Data(contentsOf: imageURL) else { return nil }
            
            return UIImage(data: data)
        }
    }
    
}
