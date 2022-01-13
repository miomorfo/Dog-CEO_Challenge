@testable import Dog_CEO_Challenge
import XCTest


class DogInfoDataSourceTest: XCTestCase {
    
    var sut: DogInfoDataSource!
    var viewController: DogInfoViewController!
    var presenter: DogInfoPresenter!
    var serviceLocator: DogCeoServiceLocator!
    var tableView: UITableView!
    
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    override func setUp() {
        super.setUp()
        serviceLocator = DogCeoServiceLocator()
        sut = DogInfoDataSource()
        presenter = DogInfoPresenter()
        viewController = DogInfoViewController(
            presenter: presenter,
            delegate: DogInfoDelegate(),
            dataSource: sut
        )
        
        tableView = UITableView()
    }
    
    override func tearDown() {
        super.tearDown()
        serviceLocator = nil
        presenter = nil
        viewController = nil
    }
    
    func testWhenCellForRowAtModelCount() {
        let expectention = 5
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: .zero)
        XCTAssertEqual(numberOfRows, expectention)
    }
    
    func testCellForRowAtType() {
        viewController.viewDidLoad()
        for(index, celltype) in sut.cellTypes.enumerated() {
            switch celltype {
            case .title:
                let titleCell: DogNameCell? = customCell(indexPath: IndexPath(row: index, section: 0))
                XCTAssertNotNil(titleCell)
            case .info:
                let descriptionCell: DogDescriptionCell? = customCell(indexPath: IndexPath(row: index, section: 0))
                XCTAssertNotNil(descriptionCell)
            case  .picture:
                  let imagenCell: DogImageCell? = customCell(indexPath: IndexPath(row: index, section: 0))
                  XCTAssertNotNil(imagenCell)
            case .button:
                let buttonCell: DogButtonCell? = customCell(indexPath: IndexPath(row: index, section: 0))
                XCTAssertNotNil(buttonCell)
            case .spacer:
                let spacer: UITableViewCell? = customCell(indexPath: IndexPath(row: index, section: 0))
                XCTAssertNotNil(spacer)
            }
        }
    }
    
    private func customCell<T>(indexPath: IndexPath) -> T? {
        let tableView = viewController.view.subviews[0] as! UITableView
        guard let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? T else {
            XCTFail()
            return nil
        }
        return cell
    }
    
}
