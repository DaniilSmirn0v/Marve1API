//
//  URL extension.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation

extension URL {
    
    static func url(with baseURL: String, endpoint: String, page: Int = 0, queryParametrs: [String: Any]) -> URL? {
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint),
                var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
          urlComponents.queryItems = queryParametrs.map { URLQueryItem(name: $0, value: "\($1)")}
          return urlComponents.url
      }
}
