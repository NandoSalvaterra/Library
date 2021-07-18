//
//  ProductRepository.swift
//  Library
//  
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

/// A `Repository` responsible for all operations related to the `Products` feature.
///
/// It can use `LocalData` or `RemoteData` for dealing with all operations like saving and fetching data.
class ProductRepository: ProductRepositoryProtocol {

    let remoteData: ProductRemoteDataProtocol
    let localData: ProductLocalDataProtocol

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.remoteData = ProductRemoteData()
        self.localData = ProductLocalData()
    }

    /// Returns a Publisher that will emit values ​​when returned from the a network or a database. It can be an array of `LibraryProduct` or an `LibraryError`.
    /// - Returns: A Publisher that will emit values ​​when returned from the a network or a database. It can be an array of `LibraryProduct` or an `LibraryError`.
    func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError> {
        return fetchProducts()
            .flatMap { self.saveProducts($0) }
            .map { return $0.map { LibraryProduct(record: $0)} }
            .eraseToAnyPublisher()
    }

    /// Returns a Publisher that will emit values ​​when returned from a database and searched by price. It can be an array of `LibraryProduct` or an `LibraryError`.
    /// - Parameters:
    ///   - price: A  `Double` to represent a price.
    /// - Returns: Publisher that will emit values ​​when returned from a database and searched by price. It can be an array of `LibraryProduct` or an `LibraryError`.
    func searchProducts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError> {
        return localData.searchProducts(price: price)
            .map { return $0.map { LibraryProduct(record: $0)} }
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

    /// Returns a Publisher that will emit values ​​when returned from a database and filtered by price. It can be  a `LibraryProduct` or an `LibraryError`.
    /// - Parameters:
    ///   - cost: A `ProductCost` to represent the `Highest` or `Lowest` costs.
    /// - Returns: Publisher that will emit values ​​when returned from a database and filtered by price. It can be  a `LibraryProduct` or an `LibraryError`.
    func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError> {
        return localData.filterProducts(cost: cost)
            .map { LibraryProduct(record: $0) }
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

    // MARK: - Private API

    /// Returns a Publisher that will emit values ​​when returned from the a network  request. It can be an array of `ProductResponse` or an `LibraryError`.
    /// - Returns: A Publisher that will emit values ​​when returned from the a network  request. It can be an array of `ProductResponse` or an `LibraryError`.
    private func fetchProducts() -> AnyPublisher<[ProductResponse], LibraryError> {
        return remoteData.getProducts()
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

    /// Returns a Publisher that will emit values ​​when the `LocalData` layer finishes saving products. It can be an array `ProductRecord` or an `LibraryError`.
    /// - Parameters:
    ///   - products: An array of `ProductResponse` to be stored.
    /// - Returns: Publisher that will emit values ​​when the `LocalData` layer finishes saving products. It can be an array `ProductRecord` or an `LibraryError`.
    private func saveProducts(_ products: [ProductResponse]) -> AnyPublisher<[ProductRecord], LibraryError> {
        return Future { promise in
            let records = products.map { ProductRecord(response: $0) }
            self.localData.saveProducts(records).sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    promise(.failure(LibraryError.localError(error)))
                }
            } receiveValue: { success in
                promise(.success(records))
            }.store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
}
