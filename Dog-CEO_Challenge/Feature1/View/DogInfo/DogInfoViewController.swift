import UIKit

class DogInfoViewController: UIViewController {
    
    private var presenter: DogInfoPresenterProtocol?
    private var delegate: DogInfoDelegate?
    private var dataSource: DogInfoDataSource?
    
    var tableView = UITableView(frame: .zero)
    
    convenience init(
        presenter: DogInfoPresenterProtocol,
        delegate: DogInfoDelegate,
        dataSource: DogInfoDataSource
    )
    {
        self.init()
        delegate.viewController = self
        dataSource.viewController = self
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        
    }
    
    func prepare() {
        //TODO: move to constants
        title = "nueva vista de detalle"
        preapareTableView()
        registerCells()
    }
    
    func registerCells() {
        tableView.register(DogNameCell.self, forCellReuseIdentifier: "CustomTitleCell")
        tableView.register(DogDescriptionCell.self, forCellReuseIdentifier: "CustomDescriptionCell")
    }
    
    func preapareTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addAutoLayout(subview: tableView)
        //TODO: averiguar como implementan "Pin"
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: .zero),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .zero),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .zero),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero)
        ])
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
    }
}


