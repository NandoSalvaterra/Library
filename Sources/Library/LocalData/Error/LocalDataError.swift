//
//  LocalDataError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

/// Represents errors that the `LocalData` layer might return.
enum LocalDataError: Error {

    /// Represents some error while saving or retrieving data from database.
    case databaseError(error: Error)
}
