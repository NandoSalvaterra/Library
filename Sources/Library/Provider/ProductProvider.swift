//
//  ProductProvider.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

public class ProductProvider {

    let getProductsUseCase: GetProductsUseCaseProtocol
    let searchProductsUseCase: SearchProductsUseCaseProtocol
    let filterProductsUseCase: FilterProductsUseCaseProtocol

    public init() {
        self.getProductsUseCase = GetProductsUseCase()
        self.searchProductsUseCase = SearchProductsUseCase()
        self.filterProductsUseCase = FilterProductsUseCase()
    }

    public func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError> {
        return getProductsUseCase.execute()
    }

    public func searchProduts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError> {
        return searchProductsUseCase.execute(price: price)
    }

    public func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError> {
        return filterProducts(cost: cost)
    }
}
