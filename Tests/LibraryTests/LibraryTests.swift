    import XCTest
    import Combine
    @testable import Library

    final class LibraryTests: XCTestCase {

        private var cancellables = Set<AnyCancellable>()

        func testExample() {
            let expect = expectation(description: "TESTE")

            ProductRepository().getProducts().sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    XCTAssert(false, "Access Token cant be nil.")
                    expect.fulfill()
                }
            } receiveValue: { array in
                print(array)
                XCTAssert(true)
                expect.fulfill()
            }.store(in: &cancellables)

            waitForExpectations(timeout: 10) { (error) in
                guard let error = error else { return }
                print("error \(error.localizedDescription)")
            }
        }

        func testExample02() {
            let expect = expectation(description: "TESTE")

            ProductRepository().searchProducts(price: 120.0).sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    XCTAssert(false, "Access Token cant be nil.")
                    expect.fulfill()
                }
            } receiveValue: { array in
                print(array)
                XCTAssert(true)
                expect.fulfill()
            }.store(in: &cancellables)

            waitForExpectations(timeout: 10) { (error) in
                guard let error = error else { return }
                print("error \(error.localizedDescription)")
            }
        }

       func testExample03() {
            let expect = expectation(description: "TESTE")

        ProductRepository().filterProducts(cost: .highest).sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    XCTAssert(false, "Access Token cant be nil.")
                    expect.fulfill()
                }
            } receiveValue: { array in
                print(array)
                XCTAssert(true)
                expect.fulfill()
            }.store(in: &cancellables)

            waitForExpectations(timeout: 10) { (error) in
                guard let error = error else { return }
                print("error \(error.localizedDescription)")
            }
        }
    }
