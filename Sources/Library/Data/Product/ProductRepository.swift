//
//  ProductRepository.swift
//  Library
//  
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

class ProductRepository: ProductRepositoryProtocol {

    let remoteData: ProductRemoteDataProtocol
    let localData: ProductLocalDataProtocol

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.remoteData = ProductRemoteData()
        self.localData = ProductLocalData()
    }

    func getProducts() -> AnyPublisher<[LibraryProduct], LibraryError> {
        return fetchProducts()
            .flatMap { self.saveProducts($0) }
            .map { return $0.map { LibraryProduct(record: $0)} }
            .eraseToAnyPublisher()
    }

    func searchProducts(price: Double) -> AnyPublisher<[LibraryProduct], LibraryError> {
        return localData.searchProducts(price: price)
            .map { return $0.map { LibraryProduct(record: $0)} }
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

    func filterProducts(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError> {
        return localData.filterProducts(cost: cost)
            .map { LibraryProduct(record: $0) }
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

    // MARK: - Private API

    private func fetchProducts() -> AnyPublisher<[ProductResponse], LibraryError> {
        return remoteData.getProducts()
            .mapError { LibraryError.remoteError($0) }
            .eraseToAnyPublisher()
    }

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
