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

    var viewModel = DogListViewModel(serviceDS: ExternalService())
    var viewModel2 = DogNamesViewModel(dogNames: [])
    let dogUseCase = DogCeoServiceLocator().dogCEOUseCases
    var datos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
//        bindData()
//        viewModel.fetchData()
        dogUseCase.execute { [weak self] res, err in
            guard let res = res else {
                print("error")
                return
            }
            self?.datos = res.message
            self?.tableView.reloadData()
        }
        
    }
}


/*
 crear presenter con el protocol
 el protocol de la vista
 los objetos para el datasource y el delegate
 implementar la lógica del presenter
 
 */
