import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleDogString: String = DetailViewConstans.empty
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PrepateTitle()
        registerCell()
        bindData()
        viewModel.fetchData(image: titleDogString)
    }
    
    
    private func PrepateTitle() {
        if titleDogString.isEmpty {
            title = DetailViewConstans.unavailableTitle
        } else {

            title = titleDogString
        }
    }
    
}
