//
//  SearchProductsUseCase.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

class SearchProductsUseCase: SearchProductsUseCaseProtocol {

    let repository: ProductRepositoryProtocol

    init() {
        self.repository = ProductRepository()
    }

    func execute(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError> {
        return repository.searchProducts(price: price)
    }
}
