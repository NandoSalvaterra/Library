//
//  GetProductsUseCaseProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Combine

protocol GetProductsUseCaseProtocol {

    func execute() -> AnyPublisher<[LibraryProduct], LibraryError>
}
