//
//  char.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import Foundation

// MARK: - MarvelData
struct MarvelData: Codable {
    let code: Int
    let status: String
//    let copyright, attributionText, attributionHTML: String?
//    let etag: String?
    let data: DataChatacters
}



