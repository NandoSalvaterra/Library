//
//  LibraryError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

enum LibraryError: Error {

    case localError(_ error: Error)
    case remoteError(_ error: Error)
}
