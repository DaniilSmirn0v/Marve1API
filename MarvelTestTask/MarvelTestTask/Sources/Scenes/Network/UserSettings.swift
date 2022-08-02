//
//  UserSettings.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import Foundation
import CryptoKit

class  UserSettings {
    
    static let baseURL = "https://gateway.marvel.com/v1/public/"
    static let endPoint = "characters"
    
    static let privateKey = "6bc2d69d2ea4deeca327825bdc4b91b8a9f7f0f3"
    
    static let publicKey = "516c0059f27b0f5f8e437bcd8c950aa7"
    
    static let limit = 100
    
    static var page = 0
    
    static var hash: String {
        let hash = Insecure.MD5.hash(
            data: "\(tsForApi)\(privateKey)\(publicKey)".data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
    static var offset: Int {
        self.page * self.limit
    }
    
    static var queryItems : [String: Any] {
        return [
//                 "offset": offset,
                 "limit": limit,
                 "ts": tsForApi,
                 "apikey": publicKey,
                 "hash":hash]
    }
    
    
    static var tsForApi = NSDate().timeIntervalSince1970.description
    

}
