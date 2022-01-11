@testable import Dog_CEO_Challenge
import XCTest

class DogCeoUseListCasesTest: XCTestCase {
    var sut: DogCeoUseCases!
    var repository: DogRepositoryMock!
    

    override func setUp() {
        super.setUp()
        repository = DogRepositoryMock()
        sut = DogCeoUseCases(dogsRepository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenDogListIsSuccess() {
        let expectation = XCTestExpectation(description: "testWhenDogListIsSuccess")
        repository.success = true
        sut.execute { response, error in
            expectation.fulfill()
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            
        }
    }
    
    func testWhenDogListIsFailure() {
        let expectation = XCTestExpectation(description: "testWhenDogListIsFailure")
        repository.success = false

        sut.execute { response, error in
            expectation.fulfill()
            XCTAssertNil(response)
            XCTAssertNotNil(error)
        }
    }
}
