//
//  LibraryProduct.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

class LibraryProduct {

    var id: String?
    var name: String?
    var information: String?
    var imageURL: String?
    var price: String?
    var color: String?
    var created: Date?

    init(record: ProductRecord) {
        self.id = record.id
        self.name = record.name
        self.information = record.information
        self.imageURL = record.imageURL
        self.price = record.price
        self.color = record.color
        self.created = record.created
    }
}
