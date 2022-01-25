@testable import Dog_CEO_Challenge
import XCTest
import Alamofire
import Mimic

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
        let endpoint =  Enpoints.urlBase + Enpoints.enpoints.list
        let jsonBody = getJson(file: "DogList")
        mimic(request: mimicRequest(method: .get, url: endpoint, Wildcard: false), response: mimicResponse(jsonBody: jsonBody, status: 200, headers: [:]))
        sut.getDogNames { response, error in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testWhenDogImagesIsSucces() {
        let endpoint =  Enpoints.urlBase + Enpoints.enpoints.detail
        let jsonBody = getJson(file: "DogImage")
        mimic(request: mimicRequest(method: .get, url: endpoint, Wildcard: false), response: mimicResponse(jsonBody: jsonBody, status: 200, headers: [:]))
        let expectation = XCTestExpectation(description: "Success")
        sut.getDogImages(name: "corgi") { response, error in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
//    func testWhenDogListIs400() {
//        let expectation = XCTestExpectation(description: "Failure")
//        let endpoint =  Enpoints.urlBase + Enpoints.enpoints.list
//        let jsonBody = getJson(file: "DogList_400")
//        mimic(request: mimicRequest(method: .get, url: endpoint, Wildcard: false), response: mimicResponse(jsonBody: jsonBody, status: 400, headers: [:]))
//        sut.getDogNames { response, error in
//            XCTAssertNil(response)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 5)
//    }
    
    func testWhenDogImagesIsFailure() {
        let expectation = XCTestExpectation(description: "Failure")
        
        sut.getDogImages(name: "") { response, error in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    private func getJson(file: String) -> AnyObject {
        let bundle = Bundle(for: type(of: self))
        guard let jsonBody = bundle.url(forResource: file, withExtension: "json")  else { fatalError("error leyendo json") }
        return jsonBody as AnyObject
    }

}

