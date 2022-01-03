import UIKit

extension DetailViewController: DogDetailViewProtocol {
    func showImages(images: DogImagesViewModel) {
        viewModel = images
        tableView.reloadData()
    }
}



