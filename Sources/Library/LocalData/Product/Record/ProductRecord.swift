//
//  ProductRecord.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

class ProductRecord: Codable {

    var id: String?
    var name: String?
    var information: String?
    var imageURL: String?
    var price: String?
    var color: String?
    var created: Date?

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
