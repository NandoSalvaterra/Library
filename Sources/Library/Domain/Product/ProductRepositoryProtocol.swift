//
//  ProductRepositoryProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

protocol ProductRepositoryProtocol {

    func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError>
    func searchProducts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError>
    func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError>
}
