//
//  RemoteDataError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

/// Represents errors that the `RemoteData` layer might return.
enum RemoteDataError: Error {

    /// Represents some error while saving or retrieving data from network.
    case networkError(_ error: Error)
}
