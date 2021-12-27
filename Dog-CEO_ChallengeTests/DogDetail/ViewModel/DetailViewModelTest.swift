@testable import Dog_CEO_Challenge
import XCTest

class DetailViewModelTest: XCTestCase {
    var sut: DetailViewModel!
    var serviceDS: ServiceDataSource!
    
    override func setUpWithError() throws {
        serviceDS = StubData()
        sut = DetailViewModel(serviceDS: serviceDS)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_when_response_not_get_data() {
        serviceDS = StubData()
        sut = DetailViewModel(serviceDS: serviceDS)
        XCTAssertEqual(sut.arrayData.count, 0)
    }
    
    func test_when_response_is_success_most_be_not_null() {
        let dataStub = StubData()
        dataStub.dogsData = DogModel(message: [
                                                "https://images.dog.ceo/breeds/perro/n02088094_1003.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_1007.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_1023.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_10263.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_10715.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_10822.jpg",
                                                "https://images.dog.ceo/breeds/perro/n02088094_10832.jpg"],
                                     status: "success")
        sut = DetailViewModel(serviceDS: dataStub)
        XCTAssertEqual(sut.arrayData.count, 1)
    }
    
    func test_when_response_is_success_but_null() {
        let dataStub = StubData()
        dataStub.dogsData = DogModel(message: [],
                                     status: "success")
        sut = DetailViewModel(serviceDS: dataStub)
        XCTAssertEqual(sut.arrayData.count, 0)
    }
}
