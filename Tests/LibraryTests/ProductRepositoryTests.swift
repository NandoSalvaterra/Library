//
//  ProductRepositoryTests.swift
//  Library
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import XCTest
import Combine
@testable import Library

final class ProductRepositoryTests: XCTestCase {

    private var repository: ProductRepositoryProtocol!
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        self.repository = ProductRepository()
    }

    func testGetProducts() {
        let expect = expectation(description: "Get Products from Remote or Local Data layers.")
        repository.getProducts().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expect.fulfill()
            }
        } receiveValue: { products in
            XCTAssert(true)
            expect.fulfill()
        }.store(in: &cancellables)

        waitForExpectations(timeout: 30) { (error) in
            guard let error = error else { return }
            print("error \(error.localizedDescription)")
        }
    }

    func testSearchProducts() {
        let expect = expectation(description: "Search Products from Remote layer based on price.")
        repository.searchProducts(price: 373.00).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expect.fulfill()
            }
        } receiveValue: { products in
            XCTAssert(true)
            expect.fulfill()
        }.store(in: &cancellables)

        waitForExpectations(timeout: 30) { (error) in
            guard let error = error else { return }
            print("error \(error.localizedDescription)")
        }
    }

    func testFilterProductsByLowestPrice() {
        let expect = expectation(description: "Filter Products from Remote layer by lowest price.")
        repository.filterProducts(cost: .lowest).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expect.fulfill()
            }
        } receiveValue: { products in
            XCTAssert(true)
            expect.fulfill()
        }.store(in: &cancellables)

        waitForExpectations(timeout: 30) { (error) in
            guard let error = error else { return }
            print("error \(error.localizedDescription)")
        }
    }

    func testFilterProductsByHighestPrice() {
        let expect = expectation(description: "Filter Products from Remote layer by highest price.")
        repository.filterProducts(cost: .highest).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expect.fulfill()
            }
        } receiveValue: { products in
            XCTAssert(true)
            expect.fulfill()
        }.store(in: &cancellables)

        waitForExpectations(timeout: 30) { (error) in
            guard let error = error else { return }
            print("error \(error.localizedDescription)")
        }
    }
}
