//
//  SearchProductsUseCaseProtocol.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

protocol SearchProductsUseCaseProtocol {

    func execute(price: Double) -> AnyPublisher<[GloboProduct], LibraryError>
}
