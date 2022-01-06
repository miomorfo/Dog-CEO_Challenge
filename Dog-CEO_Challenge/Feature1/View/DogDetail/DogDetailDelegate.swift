import UIKit
class DogDetailDelegate: NSObject {
    weak var viewController: DetailViewController?
}

extension DogDetailDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = viewController else { return }
        let name = viewController.setData()
        let url = viewController.viewModel?.dogImages[indexPath.row] ?? ""
        
        viewController.coordinator?.goToinfoView(name: name, url: url)
    }
}
