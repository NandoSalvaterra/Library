//
//  Network.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 17/07/21.
//

import Foundation
import Combine

/// A Singleton to make HTTP Calls without any Library dependency,
///
/// It can be used with `Generics` to know what type of data it can return.
class Network {

    static let shared = Network()

    private init() { }

    var decoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
        return jsonDecoder
    }

    /// Returns a Publisher that will emit values ​​when returned from the a network request. It can be a value or an error.
    /// - Parameters:
    ///   - request: A `RequestData` instance to make the HTTP call.
    /// - Returns: A Publisher that will emit values ​​when returned from the a network request. It can be a value or an error.
    func request<T: Codable>(_ requestData: RequestData) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: requestData.url) else {
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.invalidURL("Invalid URL"))
            )
        }
        return URLSession.shared
            .dataTaskPublisher(for: requestData.buildURLRequest(with: url))
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(error: "Server error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}
