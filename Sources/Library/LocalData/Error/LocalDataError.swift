//
//  LocalDataError.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

enum LocalDataError: Error {

    case databaseError(error: Error)
}
