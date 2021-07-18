//
//  FilterProductsUseCase.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// Use Case responsible for filter products by lowest or highest prices.
class FilterProductsUseCase: FilterProductsUseCaseProtocol {

    let repository: ProductRepositoryProtocol

    init() {
        self.repository = ProductRepository()
    }

    func execute(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError> {
        return repository.filterProducts(cost: cost)
    }
}
