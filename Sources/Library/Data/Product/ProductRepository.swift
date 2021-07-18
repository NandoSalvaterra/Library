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


    init() {

    }
}
