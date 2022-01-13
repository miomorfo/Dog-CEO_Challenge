@testable import Dog_CEO_Challenge
import XCTest

class DogListDataSourceTest: XCTestCase {
    
    var sut: DogListDataSource!
    var viewController: DogListViewController!
    var presenter: DogListPresenter!
    var serviceLocator: DogCeoServiceLocator!
    var tableView: UITableView!
    
    var viewModel = DogNamesViewModel(dogNames: ["perro 1", "perro 2"])
    var viewModelEmpty = DogNamesViewModel(dogNames: [])
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    
    override func setUp() {
        super.setUp()
        serviceLocator = DogCeoServiceLocator()
        sut = DogListDataSource()
        presenter = DogListPresenter(
            dogCEOUseCases: serviceLocator.dogCeoUseCases,
            dogNamesViewModelMapper: serviceLocator.dogNamesViewModelMapper
        )
        
        viewController = DogListViewController(
            delegate: DogListDelegate(),
            dataSource: sut,
            presenter: presenter
        )
        tableView = UITableView()
    }
    
    override func tearDown() {
        super.tearDown()
        serviceLocator = nil
        presenter = nil
        viewController = nil
    }
    
    
    
    func testWhenCellForRowAtModelCountIsNill() {
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: .zero)
        XCTAssertNil(viewController.viewModel)
        XCTAssertEqual(numberOfRows, .zero)
    }
    
    func testWhenCellForRowAtModelIsEmpy() {
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: .zero)
        viewController.viewModel = viewModelEmpty
        XCTAssertNotNil(viewController.viewModel)
        XCTAssertEqual(numberOfRows, .zero)
    }
    
    func testWhenCellForRowAtModelIsNotEmpty() {
        viewController.viewModel = viewModel
        XCTAssertNotNil(viewController.viewModel)
    }
    
    func testwhenCellForRowAtModelIsNotNill() {
        viewController.tableView = tableView
        viewController.viewDidLoad()
        let cell = sut.tableView(tableView, cellForRowAt: indexPath)
        XCTAssertNil(viewController.viewModel)
        XCTAssertNotNil(cell)
    }
    
    func testCellForRowAViewControllerIsNull() {
        viewController.tableView = tableView
        viewController.viewDidLoad()
        viewController = nil
        var cell = sut.tableView(tableView, cellForRowAt: indexPath)
        cell = UITableViewCell()
        XCTAssertNil(viewController)
        XCTAssertNotNil(cell)
    }
    
}
