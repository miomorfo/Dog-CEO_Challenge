import UIKit

class DogInfoViewController: UIViewController {
    
    private var presenter: DogInfoPresenterProtocol?
    private var delegate: DogInfoDelegate?
    private var dataSource: DogInfoDataSource?
    var coordinator: MainCoordinator?
    
    var tableView = UITableView(frame: .zero)
    
    var dogName: String = DogInfoViewConstants.empty
    var dogUrl: String = DogInfoViewConstants.empty
    
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
        title = DogInfoViewConstants.title
//        title = dogName
        preapareTableView()
        registerCells()
    }
    
    func registerCells() {
        tableView.register(DogNameCell.self, forCellReuseIdentifier: "CustomTitleCell")
        tableView.register(DogDescriptionCell.self, forCellReuseIdentifier: "CustomDescriptionCell")
        tableView.register(DogImageCell.self, forCellReuseIdentifier: "CustomImageCell")
        tableView.register(DogButtonCell.self, forCellReuseIdentifier: "CustomButtonCell")
    }
    
    func preapareTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate

        view.addAutoLayout(subview: tableView)
 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: .zero),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .zero),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .zero),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero)
        ])
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
}

extension DogInfoViewController: DogButtonCellDelegate {
    func pressButton() {
        
        let alerView = UIAlertController(title: DogInfoViewConstants.AlertTexts.title, message: DogInfoViewConstants.AlertTexts.message, preferredStyle: UIAlertController.Style.alert )
        alerView.addAction(UIAlertAction(title: DogInfoViewConstants.AlertTexts.actionOK, style: UIAlertAction.Style.default, handler: nil ))
        
        self.present(alerView, animated: true, completion: nil)
    }
    
    
}


