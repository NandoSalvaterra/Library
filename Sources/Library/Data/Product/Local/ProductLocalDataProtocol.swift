//
//  ProductLocalDataProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

/// Local Data Protocol  responsible for defiine all methods related to product feature that will use offline system of storage.
protocol ProductLocalDataProtocol {

    func saveProducts(_ products: [ProductRecord]) -> AnyPublisher<Bool, LocalDataError>
    func getProducts() -> AnyPublisher<[ProductRecord], LocalDataError>
    func filterProducts(cost: ProductCost) -> AnyPublisher<ProductRecord, LocalDataError>
    func searchProducts(price: Double) -> AnyPublisher<[ProductRecord], LocalDataError>
}
