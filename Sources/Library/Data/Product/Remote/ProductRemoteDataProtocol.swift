//
//  ProductRemoteDataProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 16/07/21.
//

import Foundation
import Combine

/// Remote Data Protocol  responsible for defiine all methods related to product feature that will use online system of fetching and saving data.
protocol ProductRemoteDataProtocol {

    var url: String { get set }

    func getProducts() -> AnyPublisher<[ProductResponse], RemoteDataError>
}
