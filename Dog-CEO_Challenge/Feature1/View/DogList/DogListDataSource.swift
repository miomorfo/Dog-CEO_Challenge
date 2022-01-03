import UIKit

class DogListDataSource: NSObject {
    weak var viewController: DogListViewController?
}

extension DogListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewController = viewController else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DogListTableViewCell
        let dato = viewController.viewModel?.dogNames[indexPath.row]
        cell.title.text = dato
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewController?.viewModel?.dogNames.count ?? .zero
    }
}
