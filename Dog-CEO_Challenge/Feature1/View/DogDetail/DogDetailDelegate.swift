import UIKit
class DogDetailDelegate: NSObject {
    weak var viewController: DetailViewController?
}

extension DogDetailDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.coordinator?.goToinfoView()
    }
}
