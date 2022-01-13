@testable import Dog_CEO_Challenge
import XCTest

class DogDetailDataSourceTest: XCTestCase {
    
    var sut: DogDetailDataSource!
    var viewController: DetailViewController!
    var presenter: DogDetailPresenter!
    var serviceLocator: DogCeoServiceLocator!
    var tableView: UITableView!
    
    var viewModel = DogImagesViewModel(
        dogImages: [
            "https://images.dog.ceo/breeds/beagle/1271553739_Milo.jpg",
            "https://images.dog.ceo/breeds/beagle/1374053345_Milo.jpg"
        ])
    var viewModelEmpty = DogImagesViewModel(dogImages: [])
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    
    override func setUp() {
        super.setUp()
        serviceLocator = DogCeoServiceLocator()
        sut = DogDetailDataSource()
        presenter = DogDetailPresenter(
            dogCeoDetailUseCases: serviceLocator.dogCeoDetailUseCases,
            dogImagesViewModelMapper: serviceLocator.dogImagesViewModelMapper
        )
        viewController = DetailViewController(
            delegate: DogDetailDelegate(),
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
    
    func testCellForRowAtisObjectValid() {
        viewController.tableView = tableView
        viewController.viewDidLoad()
        viewController.viewModel = viewModel
        let cell = sut.tableView(tableView, cellForRowAt: indexPath)
        if let _ = viewController.viewModel?.dogImages[indexPath.row] {
            XCTAssertNotNil(cell)
        } else {
            XCTFail()
        }
        
    }
    
}
