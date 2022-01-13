@testable import Dog_CEO_Challenge
import XCTest
import Alamofire

class DogsAlamofireRestApiTest: XCTestCase {
    var sut: DogsAlamofireRestApi!
    let urlList = Enpoints.urlBase + Enpoints.enpoints.list
    
    override func setUp() {
        super.setUp()
        sut = DogsAlamofireRestApi()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenDogListIsSuccess() {
        let expectation = XCTestExpectation(description: "Success")
        sut.getDogNames { response, error in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testWhenDogImagesIsSucces() {
        let expectation = XCTestExpectation(description: "Success")
        sut.getDogImages(name: "corgi") { response, error in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testWhenDogImagesIsFailure() {
        let expectation = XCTestExpectation(description: "Failure")
        sut.getDogImages(name: "") { response, error in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    
    //        let bundle = Bundle(for: type(of: self))
    //        guard let url = bundle.url(forResource: "DogList", withExtension: "json") else {
    //            XCTFail("missing file ")
    //            return
    //        }
}

