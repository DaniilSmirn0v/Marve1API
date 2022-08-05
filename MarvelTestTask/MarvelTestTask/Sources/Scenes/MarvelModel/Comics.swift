//
//  File3.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation


struct Comics: Decodable {
    let items: [ComicsItem]?
    
}

struct ComicsItem: Decodable {
    let name: String?
}
