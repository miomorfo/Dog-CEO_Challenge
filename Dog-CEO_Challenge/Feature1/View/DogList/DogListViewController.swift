import UIKit

class DogListViewController: UIViewController {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet private weak var titleTop: NSLayoutConstraint! {
        didSet {
            titleTop.constant = DogListView.titleTop
        }
    }
    
    @IBOutlet private weak var titleTrailing: NSLayoutConstraint! {
        didSet {
            titleTrailing.constant = DogListView.titleTrailing
        }
    }
    
    @IBOutlet private weak var titleLeading: NSLayoutConstraint! {
        didSet {
            titleLeading.constant = DogListView.titleLeading
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var delegate: DogListDelegate?
    private var dataSource: DogListDataSource?
    private var presenter: DogListPresenterProtocol?
    var viewModel: DogNamesViewModel?
    
    
    convenience init( delegate: DogListDelegate, dataSource: DogListDataSource, presenter: DogListPresenterProtocol) {
        self.init()
        dataSource.viewController = self
        delegate.viewController = self
        self.presenter = presenter
        self.delegate = delegate
        self.dataSource = dataSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        prepareTableView()
        getDogsFromPresenter()
    }
    
    private func prepareTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "DogListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func getDogsFromPresenter() {
        presenter?.getDogs()
    }
    
//    private func bindData() {
//        viewModel.reloadData = { [weak self] () in
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }
//    }
}


/*
 crear presenter con el protocol
 el protocol de la vista
 los objetos para el datasource y el delegate
 implementar la lógica del presenter
 */
