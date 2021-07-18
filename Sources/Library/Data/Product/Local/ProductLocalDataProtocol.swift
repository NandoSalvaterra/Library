//
//  ProductLocalDataProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

protocol ProductLocalDataProtocol {

    func saveProducts(_ products: [ProductRecord]) -> AnyPublisher<Bool, LocalDataError>
    func getProducts() -> AnyPublisher<[ProductRecord], LocalDataError>
    func filterProducts(cost: ProductCost) -> AnyPublisher<ProductRecord, LocalDataError>
    func searchProducts(price: Double) -> AnyPublisher<[ProductRecord], LocalDataError>
}
