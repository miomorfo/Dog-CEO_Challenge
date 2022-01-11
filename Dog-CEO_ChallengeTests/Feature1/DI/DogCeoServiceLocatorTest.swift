@testable import Dog_CEO_Challenge
import XCTest

class DogCeoServiceLocatorTest: XCTestCase {
    var sut: DogCeoServiceLocator!
    
    override func setUp() {
        super.setUp()
        sut = DogCeoServiceLocator()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenDogCeoServiceLocatorIsNotNill() {
        XCTAssertNotNil(sut)
    }
    
    func testUseCases() {
        XCTAssertNotNil(sut.dogCeoUseCases)
        XCTAssertNotNil(sut.dogCeoDetailUseCases)
    }
    
    func testMapper() {
        XCTAssertNotNil(sut.dogNamesViewModelMapper)
        XCTAssertNotNil(sut.dogImagesViewModelMapper)
    }
}
