@testable import Dog_CEO_Challenge
import XCTest

class DogListDelegateTest: XCTestCase {
    var sut: DogListDelegate!
    var tableView: UITableView!
    var viewController: DogListViewController!
    var serviceLocator: DogCeoServiceLocator!
    var coordinator: MainCoordinator!
    
    var modelEmpty = DogNamesViewModel(dogNames: [""])
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    
    override func setUp() {
        super.setUp()
        sut = DogListDelegate()
        serviceLocator = DogCeoServiceLocator()
        coordinator = MainCoordinator()
        viewController = DogListViewController(
            delegate: sut,
            dataSource: DogListDataSource(),
            presenter: DogListPresenter(
                dogCEOUseCases: serviceLocator.dogCeoUseCases,
                dogNamesViewModelMapper: serviceLocator.dogNamesViewModelMapper)
        )
        viewController.coordinator = coordinator
        viewController.viewModel = DogNamesViewModel(dogNames: ["perro 1", "perro 2"])
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
        XCTAssertTrue(coordinator.goTodetailViewCalled)
    }
    
    func testDidSelectRowAtWhenCoordinatorIsFalse() {
        let coordinator = MainCoordinatorMock()
        viewController.coordinator = coordinator
        sut.viewController = nil
        sut.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssertFalse(coordinator.goTodetailViewCalled)
    }
    
    func testDidSelectRowAtWhenObjectdPasses() {
        let coordinator = MainCoordinatorMock()
        viewController.coordinator = coordinator
        sut.tableView(tableView, didSelectRowAt: indexPath)
        let object = viewController.viewModel?.dogNames[indexPath.row]
        XCTAssertNotNil(object)
        XCTAssertNotNil(coordinator.goToDetailView(name: object!))
    }
    
    func testDidSelectRowAtWhenNotObjectdPasses() {
        let coordinator = MainCoordinator()
        viewController.coordinator = coordinator
        sut.tableView(tableView, didSelectRowAt: indexPath)
        viewController.viewModel = nil
        let object = viewController.viewModel?.dogNames[indexPath.row]
        XCTAssertNil(object)
        XCTAssertNotNil(coordinator.goToDetailView(name:))
    }
    
}
