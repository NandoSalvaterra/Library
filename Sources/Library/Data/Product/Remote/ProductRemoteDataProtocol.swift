//
//  ProductRemoteDataProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

protocol ProductRemoteDataProtocol {

    var url: String { get set }
    var network: Network { get set }

    func getProducts() -> AnyPublisher<[ProductResponse], NetworkError>
}
