//
//  RequestData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

struct RequestData {

    let url: String
    let httpMethod: HTTPMethod
    let headers: [String: String]?

    init(url: String, httpMethod: HTTPMethod = .get, headers: [String: String]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
    }

    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        return urlRequest
    }
}
