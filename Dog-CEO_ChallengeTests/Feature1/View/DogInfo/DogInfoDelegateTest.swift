@testable import Dog_CEO_Challenge
import XCTest

class DogInfoDelegateTest: XCTestCase {
    var sut: DogInfoDelegate!
    var tableView: UITableView!
    var viewController: DogInfoViewController!
    var serviceLocator: DogCeoServiceLocator!
    
    let indexPath: IndexPath = IndexPath(row: 0, section: 0)
    let image = "https://images.dog.ceo/breeds/beagle/Joey.jpg"
    
    override func setUp() {
        super.setUp()
        sut = DogInfoDelegate()
        serviceLocator = DogCeoServiceLocator()
        viewController = DogInfoViewController(
            presenter: DogInfoPresenter(),
            delegate: sut,
            dataSource: DogInfoDataSource()
        )
        
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
    
    func testestimatedHeightForRowAt() {
        let expectationHeight = UITableView.automaticDimension
        let cellType = DogInfoCellType.default
        
        for index in 0 ..< cellType.count {
            let indexpath = IndexPath(row: 0, section: index)
            let height = sut.tableView(tableView, estimatedHeightForRowAt: indexpath)
            XCTAssertEqual(height, expectationHeight)
        }
        
    }
    
    func testTableViewHeight() {
        for(index, cellType) in sut.cellTypes.enumerated() {
            let height = sut.tableView(tableView, heightForRowAt: IndexPath(row: index, section: 0))
            
            switch cellType {
            case .button, .info, .spacer, .title:
                XCTAssertEqual(height, UITableView.automaticDimension)
            case.picture :
                XCTAssertEqual(height, 200)
            }
        }
    }
    
    
}
