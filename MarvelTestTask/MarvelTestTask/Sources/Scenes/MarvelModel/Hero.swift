//
//  File4.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation
// MARK: - Result
struct Hero: Codable {
    let id: Int
    let name, resultDescription: String
    //let modified: Date?
    let thumbnail: Thumbnail
    //let resourceURI: String?
    //let comics, series: Comics?
    //let stories: Stories?
    //let events: Comics?
    let urls: [URLElement]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail, urls
    }
}



// MARK: - Thumbnail
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

// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}
