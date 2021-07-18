//
//  ProductRepositoryProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

/// Repository Protocol  responsible for defiine all methods related to product feature.
protocol ProductRepositoryProtocol {

    func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError>
    func searchProducts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError>
    func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError>
}
