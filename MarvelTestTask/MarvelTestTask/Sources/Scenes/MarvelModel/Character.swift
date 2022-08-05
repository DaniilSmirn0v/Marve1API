//
//  File4.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    var name: String?
    let description: String?
    let image: Thumbnail?
    let comicsImages: [Thumbnail]?
    let comics: Comics?
 
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case comicsImages = "images"
        case image = "thumbnail"
        case comics

    }
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
    
    var url: String {
        return path + "." + thumbnailExtension
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

