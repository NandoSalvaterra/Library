//
//  NetworkError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(_ error: String)
    case invalidJSON(_ error: String)
    case serverError(error: String)
    case unknown(error: String)
}
