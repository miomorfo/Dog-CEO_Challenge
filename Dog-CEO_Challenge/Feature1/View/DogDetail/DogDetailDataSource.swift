import UIKit

class DogDetailDataSource: NSObject {
    weak var viewController: DetailViewController?
}

extension DogDetailDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewController = viewController else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailViewCell
        if let object = viewController.viewModel?.dogImages[indexPath.row] {
            let url = URL(string: object)
            cell.imageDog.load(url: url!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.viewModel?.dogImages.count ?? .zero
    }
}
