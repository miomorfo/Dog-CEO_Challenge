import UIKit

class DogDetailDataSource: NSObject {
    weak var viewController: DetailViewController?
}

extension DogDetailDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewController = viewController else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailViewCell
        let object = viewController.viewModel?.dogImages[indexPath.row] ?? DetailViewConstans.GenericImage.image
        let url = URL(string: object)
        cell.imageDog.load(url: url!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #if DEBUG
        print("cantidad imagenes del perro \(String(describing: viewController?.viewModel?.dogImages.count))")
        #endif
        return viewController?.viewModel?.dogImages.count ?? 30
    }
}
