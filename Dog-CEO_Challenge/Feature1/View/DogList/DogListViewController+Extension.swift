import UIKit

extension DogListViewController: DogListViewProtocol {
    func update(dogs: DogNamesViewModel) {
        viewModel = dogs
        updateTableView()
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
}
