//
//  SearchProductsUseCaseProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// Use Case Protocol  responsible for searching products using price.
protocol SearchProductsUseCaseProtocol {

    func execute(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError>
}
