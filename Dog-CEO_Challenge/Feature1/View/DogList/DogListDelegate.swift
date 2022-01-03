import UIKit

class DogListDelegate: NSObject {
    weak var viewController: DogListViewController?
}

extension DogListDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let objectDog = viewModel.arrayData[indexPath.row]
//        let detailVC = DetailViewController()
//        let navigationVC = UINavigationController(rootViewController: detailVC)
//        detailVC.titleDogString = objectDog
//        present(navigationVC, animated: true, completion: nil)
    }
}


/*
 
 
 */



