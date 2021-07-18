//
//  LibraryError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

/// The kind of errors that the `Provider` layer might return.
public enum LibraryError: Error {

    /// Represents an error while  feching or saving data in `LocalData` layer
    /// It contains another error that provides information about the error that happens inside `LocalData` layer.
    case localError(_ error: Error)

    /// Represents an error while  feching or saving data in `RemoteData` layer
    /// It contains another error that provides information about the error that happens inside `RemoteData` layer.
    case remoteError(_ error: Error)
}
