//
//  FilterProductsUseCaseProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

protocol FilterProductsUseCaseProtocol {

    func execute(cost: ProductCost) -> AnyPublisher<LibraryProduct, LibraryError>
}
