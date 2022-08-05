//
//  Characters.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 04.08.2022.
//

import Foundation

struct Characters: Decodable {
    let count: Int
    let results: [Character]
}
