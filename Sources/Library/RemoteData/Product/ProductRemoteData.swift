//
//  ProductRemoteData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// Represents a `RemoteData` layer related to `Products` feature  that can use `Network` to fech all data needed.
class ProductRemoteData: ProductRemoteDataProtocol {

    var url: String

    init() {
        self.url = "https://60885258a6f4a30017426369.mockapi.io/products"
    }

    /// Returns a Publisher that will emit values ​​when returned from the a network request. It can be an array of `Response` objects  or an `RemoteDataError`.
    /// - Returns: A Publisher that will emit values ​​when returned from the a network request. It can be a value or an error.
    func getProducts() -> AnyPublisher<[ProductResponse], RemoteDataError> {
        let requestData = RequestData(url: url, httpMethod: .get)
        return Network.shared.request(requestData).mapError { RemoteDataError.networkError($0)}.eraseToAnyPublisher()
    }
}
