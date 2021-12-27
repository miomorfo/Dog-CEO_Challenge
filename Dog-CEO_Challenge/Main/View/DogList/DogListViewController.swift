import UIKit

class DogListViewController: UIViewController {
    
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

    var viewModel = DogListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        bindData()
        viewModel.fetchData()
    }
}
