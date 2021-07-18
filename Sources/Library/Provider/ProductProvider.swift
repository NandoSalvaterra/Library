//
//  ProductProvider.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// Provides all API's  necessary to work with products
///
/// It can use Local Storage to fech and save data as well as HTTP Requests, all that logic is encapsulated and
/// you dont have access to them.
public class ProductProvider {

    let getProductsUseCase: GetProductsUseCaseProtocol
    let searchProductsUseCase: SearchProductsUseCaseProtocol
    let filterProductsUseCase: FilterProductsUseCaseProtocol

    public init() {
        self.getProductsUseCase = GetProductsUseCase()
        self.searchProductsUseCase = SearchProductsUseCase()
        self.filterProductsUseCase = FilterProductsUseCase()
    }

    /// Returns a Publisher that will emit values with products. The value ca also be an error.
    /// - Returns: A Publisher that will emit an array of  `LibraryProduct` or an error of `LibraryError` type.
    public func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError> {
        return getProductsUseCase.execute()
    }

    /// Returns a Publisher that will emit values with products of a given price ​. The value ca also be an error.
    /// - Returns: A Publisher that will emit an array of  `LibraryProduct` or an error of `LibraryError` type.
    public func searchProduts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError> {
        return searchProductsUseCase.execute(price: price)
    }

    /// Returns a Publisher that will emit values with a single product of lowest or highest price. The value ca also be an error.
    /// - Returns: A Publisher that will emit an `LibraryProduct` object or an error of `LibraryError` type.
    public func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError> {
        return filterProducts(cost: cost)
    }
}
