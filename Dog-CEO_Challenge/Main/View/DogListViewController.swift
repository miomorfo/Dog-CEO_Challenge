import UIKit

class DogListViewController: UIViewController {
    
    @IBOutlet weak var titleTop: NSLayoutConstraint! {
        didSet {
            titleTop.constant = DogListView.titleTop
        }
    }
    
    @IBOutlet weak var titleTrailing: NSLayoutConstraint! {
        didSet {
            titleTrailing.constant = DogListView.titleTrailing
        }
    }
    
    @IBOutlet weak var titleLeading: NSLayoutConstraint! {
        didSet {
            titleLeading.constant = DogListView.titleLeading
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
