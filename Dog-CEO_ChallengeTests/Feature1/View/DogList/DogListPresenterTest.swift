@testable import Dog_CEO_Challenge
import XCTest


class DogListPresenterTest: XCTestCase {
    
    var sut: DogListPresenter!
    var serviceLocator: DogCeoServiceLocator!
    var repository: DogRepositoryMock!
    var view : DogListViewMock!
    
    
    override func setUp() {
        super.setUp()
        serviceLocator = DogCeoServiceLocator()
        repository = DogRepositoryMock()
        view = DogListViewMock()
        
        let useCase = DogCeoUseCases(dogsRepository: repository)
        
        sut = DogListPresenter(
            dogCEOUseCases: useCase,
            dogNamesViewModelMapper: serviceLocator.dogNamesViewModelMapper
        )
        sut.dogListView = view
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        view = nil
        repository = nil
        serviceLocator = nil
    }
    
    func testWhenGetDogsListSuccess() {
        repository.success = true
        sut.getDogs()
        XCTAssertTrue(repository.dogListCalled)
        XCTAssertTrue(view.updateCalled)
    }
    
    func testWhenGetDogsListFailure() {
        repository.success = false
        sut.getDogs()
        XCTAssertTrue(repository.dogListCalled)
        XCTAssertFalse(view.updateCalled)
    }
}

