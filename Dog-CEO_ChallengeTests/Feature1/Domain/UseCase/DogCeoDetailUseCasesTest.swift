@testable import Dog_CEO_Challenge
import XCTest

class DogCeoDetailUseCasesTest: XCTestCase {
    var sut: DogCeoDetailUseCases!
    var repository: DogRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = DogRepositoryMock()
        sut = DogCeoDetailUseCases(dogsRepository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenDogNamestIsSuccess() {
        let expectation = XCTestExpectation(description: "Success")
        repository.success = true
        
        sut.execute(name: "beagle") { response, error in
            expectation.fulfill()
            XCTAssertNotNil(response)
            XCTAssertNil(error)
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testWhenDogNamesIsFailure() {
        let expectation = XCTestExpectation(description: "Failure")
        repository.success = false

        sut.execute(name: "beagle") { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    
}
