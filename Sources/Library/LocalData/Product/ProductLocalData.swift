//
//  ProductLocalData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

class ProductLocalData: ProductLocalDataProtocol {

    func saveProducts(_ products: [ProductRecord]) {
        return Future { promise in
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pathWithFilename = documentDirectory.appendingPathComponent("products.json")
                do {
                    let encoded = try JSONEncoder().encode(products)
                    try encoded.write(to: pathWithFilename)
                    promise(.success(true))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }

    func getProducts() -> AnyPublisher<[ProductRecord], Error> {
        return Future { promise in
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pathWithFilename = documentDirectory.appendingPathComponent("products.json")
                do {
                    let data = try Data(contentsOf: pathWithFilename)
                    let orderRecord = try JSONDecoder().decode([ProductRecord].self, from: data)
                    promise(.success(orderRecord))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }

}
