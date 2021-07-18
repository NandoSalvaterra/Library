//
//  GetProductsUseCaseProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Combine

/// Use Case Protocol responsible for fetching products .
protocol GetProductsUseCaseProtocol {

    func execute() -> AnyPublisher<[LibraryProduct], LibraryError>
}
