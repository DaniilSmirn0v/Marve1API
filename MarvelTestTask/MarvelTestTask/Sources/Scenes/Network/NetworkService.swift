//
//  NetworkService.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import Foundation
import UIKit
import Alamofire

protocol NetworkServiceProtocol {
    func fetchCharactersData(completion: @escaping (Result<MarvelInfo, NetworkError>) -> Void)
    func fetchComicsData(with id: String, completion: @escaping (Result<[Character], NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func fetchCharactersData(completion: @escaping (Result<MarvelInfo, NetworkError>) -> Void) {
        getData(completion: completion)
    }

//    func fetchComicsData(with id: String, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
//        var url: String {
//            "\(UserSettings.baseURL)\(UserSettings.endPointCharacters)/\(id)/\(UserSettings.endPointComics)"
//        }
//        print(url)
//        let urlString = URL(string: url)
//        guard var urlComponents = URLComponents(url: urlString!, resolvingAgainstBaseURL: true) else { return }
//        urlComponents.queryItems = UserSettings.queryItems.map { URLQueryItem(name: $0, value: "\($1)")}
//        print(urlComponents.url)
//        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
//            guard let response = response as? HTTPURLResponse,
//                  (200...299).contains(response.statusCode) else {
//                completion(.failure(.serverError))
//                print(NetworkError.serverError.localizedDescription)
//                return
//                }
//            print(response)
//            guard let data = data,
//                  let comicsData = try? JSONDecoder().decode([Character].self, from: data) else {
//                    completion(.failure(.badJSON))
//                    print(NetworkError.badJSON.localizedDescription)
//                    return
//                }
//            print(comicsData)
//            completion(.success(comicsData))
//        }
//        task.resume()
//    }
    
    func fetchComicsData(with id: String, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        
        var url: String { "\(UserSettings.baseURL)\(UserSettings.endPointCharacters)/\(id)/\(UserSettings.endPointComics)" }
        
        AF.request(url, method: .get,
                   parameters: ["apikey": UserSettings.publicKey,
                                "ts": UserSettings.tsForApi,
                                "hash": UserSettings.hash],
                   encoding: URLEncoding.default)
            .validate(statusCode: 200..<299)
            .validate(contentType: ["application/json"])
            .responseData { (responseData) in
               guard let responce = responseData.response
                else {
                   return completion(.failure(.serverError)) }
            print(responce)
                if responce.statusCode >= 300 {
                    completion(.failure(.badURL))
                }
            }
            .responseDecodable(of: MarvelInfo.self) { (response) in
                guard let characters = response.value?.data
                else {
                    return completion(.failure(.badJSON)) }
                
                completion(.success(characters.results))
            }
    }
    
    
}

private extension NetworkService {
    
    func getData<T: Decodable>( completion: @escaping (Result<T, NetworkError>) -> Void) {
            guard let url = URL.url(with: UserSettings.baseURL, endpoint: UserSettings.endPointCharacters, queryParametrs: UserSettings.queryItems) else {
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
