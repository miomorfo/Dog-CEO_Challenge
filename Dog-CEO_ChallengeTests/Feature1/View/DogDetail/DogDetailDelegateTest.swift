@testable import Dog_CEO_Challenge
import XCTest

class DogDetailDelegateTest: XCTestCase {
    var sut: DogDetailDelegate!
    var tableView: UITableView!
    var viewController: DetailViewController!
    var serviceLocator: DogCeoServiceLocator!
    var coordinator: MainCoordinator!
    
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    let image = "https://images.dog.ceo/breeds/beagle/Joey.jpg"
    
    
    override func setUp() {
        super.setUp()
        sut = DogDetailDelegate()
        serviceLocator = DogCeoServiceLocator()
        coordinator = MainCoordinator()
        viewController = DetailViewController(
            delegate: sut,
            dataSource: DogDetailDataSource(),
            presenter: DogDetailPresenter(
                dogCeoDetailUseCases: serviceLocator.dogCeoDetailUseCases,
                dogImagesViewModelMapper: serviceLocator.dogImagesViewModelMapper)
        )
        viewController.coordinator = coordinator
        viewController.viewModel = DogImagesViewModel(dogImages: [
                                                        "https://images.dog.ceo/breeds/beagle/Joey.jpg",
                                                        "https://images.dog.ceo/breeds/beagle/Phoebe.jpg"
        ])
        tableView = UITableView()
        sut.viewController = viewController
        tableView.delegate = sut
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        tableView = nil
        viewController = nil
        
    }
    
    func testDidSelectRowAtisWhenCoordinatorIsTrue() {
        let coordinator = MainCoordinatorMock()
        viewController.coordinator =  coordinator
        sut.tableView(tableView, didSelectRowAt: indexPath)
        coordinator.goToInfoViewCalled = true
        XCTAssertTrue(coordinator.goToInfoViewCalled)
        
    }
    
    func testDidSelectRowAtWhenCoordinatorIsFalse() {
        
        let coordinator = MainCoordinatorMock()
        viewController.coordinator = coordinator
        sut.viewController = nil
        sut.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssertFalse(coordinator.goToInfoViewCalled)
    }
    
    func testDidSelectRowAtWhenObjectdPasses() {
        let coordinator = MainCoordinatorMock()
        viewController.coordinator = coordinator
        sut.tableView(tableView, didSelectRowAt: indexPath)
        let name = viewController.viewModel?.dogImages[indexPath.row]
        XCTAssertNotNil(name)
        XCTAssertNotNil(coordinator.goToinfoView(name: name!, url: image))
    }
    
    func testDidSelectRowAtWhenNotObjectdPasses() {
        let coordinator = MainCoordinator()
        viewController.coordinator = coordinator
        sut.tableView(tableView, didSelectRowAt: indexPath)
        viewController.viewModel = nil
        let name = viewController.viewModel?.dogImages[indexPath.row]
        XCTAssertNil(name)
        XCTAssertNotNil(coordinator.goToDetailView(name:))
    }
}
