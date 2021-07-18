//
//  NetworkError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

/// The kind of errors that the `Network` might return.
enum NetworkError: Error {
    case invalidURL(_ error: String)
    case invalidJSON(_ error: String)
    case serverError(error: String)
    case unknown(error: String)
}
