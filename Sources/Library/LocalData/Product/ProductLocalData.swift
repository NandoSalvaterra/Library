//
//  ProductLocalData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

class ProductLocalData: ProductLocalDataProtocol {

    init() { }

    func saveProducts(_ products: [ProductRecord]) -> AnyPublisher<Bool, LocalDataError> {
        return Future { promise in
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pathWithFilename = documentDirectory.appendingPathComponent("products.json")
                do {
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .formatted(Formatter.iso8601)
                    let encoded = try encoder.encode(products)
                    try encoded.write(to: pathWithFilename)
                    promise(.success(true))
                } catch let error {
                    promise(.failure(.databaseError(error: error)))
                }
            }
        }.eraseToAnyPublisher()
    }

    func getProducts() -> AnyPublisher<[ProductRecord], LocalDataError> {
        return Future { promise in
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pathWithFilename = documentDirectory.appendingPathComponent("products.json")
                do {
                    let data = try Data(contentsOf: pathWithFilename)
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
                    let procuts = try jsonDecoder.decode([ProductRecord].self, from: data)
                    promise(.success(procuts))
                } catch let error {
                    promise(.failure(.databaseError(error: error)))
                }
            }
        }.eraseToAnyPublisher()
    }

    func searchProducts(price: Double) -> AnyPublisher<[ProductRecord], LocalDataError> {
        return getProducts()
            .map { products in
                return products.filter { product in
                    return product.price == String(format: "%.2f", price)
                }
            }.eraseToAnyPublisher()
    }

    func filterProducts(cost: ProductCost) -> AnyPublisher<ProductRecord, LocalDataError> {
        return getProducts()
            .map { records in
                switch cost {
                case .highest:
                    return records.max()!
                case .lowest:
                    return records.min()!
                }
            }.eraseToAnyPublisher()
    }
}
