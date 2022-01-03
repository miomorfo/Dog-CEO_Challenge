import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleDogString: String = DetailViewConstans.empty
    
    private var dataSource: DogDetailDataSource?
    private var delegate: DogDetailDelegate?
    private var presenter: DogDetailPresenterProtocol?
    var viewModel: DogImagesViewModel?
    
    convenience init(
        delegate: DogDetailDelegate,
        dataSource: DogDetailDataSource,
        presenter: DogDetailPresenterProtocol
    )
    {
        self.init()
        dataSource.viewController = self
        delegate.viewController = self
        self.dataSource = dataSource
        self.delegate = delegate
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PrepateTitle()
        prepareTableView()
        registerCell()
        getImages(name: titleDogString)
    }
    
    func prepareTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "DetailViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    private func getImages(name: String) {
        presenter?.getImages(name: name)
    }
    private func PrepateTitle() {
        if titleDogString.isEmpty {
            title = DetailViewConstans.unavailableTitle
        } else {
            title = titleDogString
        }
    }
}
