@testable import Dog_CEO_Challenge
import XCTest

class DogListViewModelTest: XCTestCase {
    var sut: DogListViewModel!
    var serviceDS: ServiceDataSource!
    
    override func setUpWithError() throws {
        serviceDS = StubData()
        sut = DogListViewModel(serviceDS: serviceDS)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_when_response_not_get_data() {
        serviceDS = StubData()
        sut = DogListViewModel(serviceDS: serviceDS)
        XCTAssertEqual(sut.arrayData.count, 0)
    }
    
    func test_when_response_is_success_most_be_not_null() {
        let dataStub = StubData()
        dataStub.dogsData = DogModel(message: [
                                                "affenpinscher",
                                                "african",
                                                "airedale",
                                                "akita",
                                                "appenzeller",
                                                "australian",
                                                "basenji"],
                                     status: "success")
        sut = DogListViewModel(serviceDS: dataStub)
        XCTAssertEqual(sut.arrayData.count, 1)
    }
    
    func test_when_response_is_success_most_be_null() {
        let dataStub = StubData()
        dataStub.dogsData = DogModel(message: [],
                                     status: "success")
        sut = DogListViewModel(serviceDS: dataStub)
        XCTAssertEqual(sut.arrayData.count, 0)
    }

}
