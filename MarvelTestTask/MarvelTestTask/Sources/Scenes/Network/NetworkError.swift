//
//  NetworkError.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case badJSON
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Невалидный URL-адрес"
        case .badJSON:
            return "Не удается загрузить данные"
        case .serverError:
            return "Сервер не отвечает. Повторите попытку позже"
        }
    }
}
