//
//  ProductRecord.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

/// Represents a `Product` that can be saved or retrieved from database. It implements the `Comparable` protocol in order to filter `Products` by price.
class ProductRecord: Codable, Comparable {

    var id: String?
    var name: String?
    var information: String?
    var imageURL: String?
    var price: String?
    var color: String?
    var created: Date?

    init(response: ProductResponse) {
        self.id = response.id
        self.name = response.name
        self.information = response.information
        self.imageURL = response.imageURL
        self.price = response.price
        self.color = response.color
        self.created = response.created
    }

    static func == (lhs: ProductRecord, rhs: ProductRecord) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: ProductRecord, rhs: ProductRecord) -> Bool {
        return Double(lhs.price ?? "") ?? 0 < Double(rhs.price ?? "") ?? 0
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case information = "description"
        case imageURL = "image"
        case price = "price"
        case color = "color"
        case created = "createdAt"
    }
}
