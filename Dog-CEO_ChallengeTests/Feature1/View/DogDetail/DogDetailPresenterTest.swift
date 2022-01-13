@testable import Dog_CEO_Challenge
import XCTest

class DogDetailPresenterTest: XCTestCase {
    
    var sut: DogDetailPresenter!
    var servilocator: DogCeoServiceLocator!
    var repository: DogRepositoryMock!
    var view: DogDetailViewMock!
    
    override func setUp() {
        super.setUp()
        servilocator = DogCeoServiceLocator()
        repository = DogRepositoryMock()
        view = DogDetailViewMock()
        
        let useCase = DogCeoDetailUseCases(dogsRepository: repository)
        
        sut = DogDetailPresenter(
            dogCeoDetailUseCases: useCase,
            dogImagesViewModelMapper: servilocator.dogImagesViewModelMapper)
        sut.dogDetailView = view
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        view = nil
        repository = nil
        servilocator = nil
    }
    
    func testWhenGetImageSuccess() {
        repository.success = true
        sut.getImages(name: "perrito 1")
        XCTAssertTrue(repository.dogImagesCalled)
        XCTAssertTrue(view.showImageCalled)
    }
    
    func testWhenGetImageFailure() {
        repository.success = false
        sut.getImages(name: "perrito 1")
        XCTAssertTrue(repository.dogImagesCalled)
        XCTAssertFalse(view.showImageCalled)
    }
}
