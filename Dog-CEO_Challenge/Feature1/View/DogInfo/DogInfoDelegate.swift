import UIKit

class DogInfoDelegate: NSObject {
    weak var viewController: DogInfoViewController?
}

extension DogInfoDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
