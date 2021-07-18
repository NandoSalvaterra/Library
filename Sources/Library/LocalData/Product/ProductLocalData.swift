//
//  ProductLocalData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// Represents a `LocalData` layer related to `Products` feature  that can use `Database` to fech all data needed.
class ProductLocalData: ProductLocalDataProtocol {

    init() { }

    /// Returns a Publisher that will emit values ​​when it finishes to save the products in File System. It can be a value or an `LocalDataError`.
    /// - Parameters:
    ///   - products: A  list of `ProductRecord`
    /// - Returns: A Publisher that will emit values ​​when it finishes to save data in  Fille System. It can be a value or an `LocalDataError`.
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

    /// Returns a Publisher that will emit values ​​when it finishes to fetch the data  in File System. It can be a value or an error.
    /// - Returns: A Publisher that will emit values ​​when it finishes to fetch data in  Fille System. It can be an array of `ProductREcord` or an `LocalDataError`.
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

    /// Returns a Publisher that will emit values ​​when it finishes to filter products that comes from  File System. It can be an array of `ProductRecord` or an `LocalDataError`.
    /// - Parameters:
    ///   - products: A  price  of  type `Double`
    /// - Returns: Publisher that will emit values ​​when it finishes to filter products that comes from  File System. It can be an array of `ProductRecord` or an `LocalDataError`.
    func searchProducts(price: Double) -> AnyPublisher<[ProductRecord], LocalDataError> {
        return getProducts()
            .map { products in
                return products.filter { product in
                    return product.price == String(format: "%.2f", price)
                }
            }.eraseToAnyPublisher()
    }

    /// Returns a Publisher that will emit values ​​when it finishes to filter products that comes from  File System. It can be a `ProductRecord` or an `LocalDataError`.
    /// - Parameters:
    ///   - products: A  cost  of  type `ProductCost`
    /// - Returns: Publisher that will emit values ​​when it finishes to filter products that comes from  File System. It can be a `ProductRecord` or an `LocalDataError`.
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
