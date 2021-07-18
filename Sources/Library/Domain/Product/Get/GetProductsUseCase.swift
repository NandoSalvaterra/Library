//
//  GetProductsUseCase.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Combine

class GetProductsUseCase: GetProductsUseCaseProtocol {

    let repository: ProductRepositoryProtocol

    init() {
        self.repository = ProductRepository()
    }

    func execute() -> AnyPublisher<[LibraryProduct], LibraryError> {
        return repository.getProducts()
    }
}
