//
//  File.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation
// MARK: - MArvelInfo
struct MarvelInfo: Codable {
    let code: Int
    let status: String
//    let copyright, attributionText, attributionHTML: String?
//    let etag: String?
    let data: DataClass
}



