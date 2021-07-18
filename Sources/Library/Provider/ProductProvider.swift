//
//  ProductProvider.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

class ProductProvider {


    let getProductsUseCase: GetProductsUseCaseProtocol
    let searchProductsUseCase: SearchProductsUseCaseProtocol
    let filterProductsUseCase: FilterProductsUseCaseProtocol

    init() {
        self.getProductsUseCase = GetProductsUseCase()
        self.searchProductsUseCase = SearchProductsUseCase()
        self.filterProductsUseCase = FilterProductsUseCase()
    }

    func getProducts() ->  AnyPublisher<[LibraryProduct], LibraryError> {
        return getProductsUseCase.execute()
    }
}
