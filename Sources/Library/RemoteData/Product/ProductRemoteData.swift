//
//  ProductRemoteData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

class ProductRemoteData: ProductRemoteDataProtocol {

    var url: String

    init() {
        self.url = "https://60885258a6f4a30017426369.mockapi.io/products"
    }

    func getProducts() -> AnyPublisher<[ProductResponse], RemoteDataError> {
        let requestData = RequestData(url: url, httpMethod: .get)
        return Network.shared.request(requestData).mapError { RemoteDataError.networkError($0)}.eraseToAnyPublisher()
    }
}
