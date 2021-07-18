//
//  RequestData.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation

/// Responsible for encapsulating the data that will be sent in the request
///
/// Should be used with `Network` class.
struct RequestData {

    let url: String
    let httpMethod: HTTPMethod
    let headers: [String: String]?

    init(url: String, httpMethod: HTTPMethod = .get, headers: [String: String]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
    }

    /// Returns a `URLRequest` that will be used by `URLSession` to make HTTP Requests
    /// - Parameters:
    ///   - url: An `URL`  to make the request
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        return urlRequest
    }
}
