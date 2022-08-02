//
//  NetworkService.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func fetchCharactersData(completion: @escaping (Result<MarvelInfo, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
   
    func fetchCharactersData(completion: @escaping (Result<MarvelInfo, NetworkError>) -> Void) {
        getData(completion: completion)
    }
    
}

private extension NetworkService {
    
    func getData<T: Decodable>( completion: @escaping (Result<T, NetworkError>) -> Void) {
            guard let url = URL.url(with: UserSettings.baseURL, endpoint: UserSettings.endPoint, queryParametrs: UserSettings.queryItems) else {
                completion(.failure(.badURL))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode)
                else {
                    completion(.failure(.serverError))
                    print(NetworkError.serverError.localizedDescription)
                    return
                }
                
                guard let data = data,
                      let model = try? JSONDecoder().decode(T.self, from: data)
                else {
                    completion(.failure(.badJSON))
                    return
                }
                completion(.success(model))
            }
            task.resume()
        }
}
