//
//  LibraryProduct.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation

public class LibraryProduct {

    public var id: String?
    public var name: String?
    public var information: String?
    public var imageURL: String?
    public var price: String?
    public var color: String?
    public var created: Date?

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
