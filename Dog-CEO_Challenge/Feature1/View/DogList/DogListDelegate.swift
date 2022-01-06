import UIKit

class DogListDelegate: NSObject {
    weak var viewController: DogListViewController?
}

extension DogListDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = viewController else { return }
        let objectDogName = viewController.viewModel?.dogNames[indexPath.row]
        viewController.coordinator?.goToDetailView(name: objectDogName ?? "")
 
    }
}
