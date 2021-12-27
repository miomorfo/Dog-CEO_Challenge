import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleDog: UILabel!
    
    var titleDogString: String = DetailViewConstans.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PrepateTitle()
    }
    
    private func PrepateTitle() {
        if titleDogString.isEmpty {
            titleDog.text = "Nombre no disponible"
        } else {
            titleDog.text = titleDogString
        }
    }
}
