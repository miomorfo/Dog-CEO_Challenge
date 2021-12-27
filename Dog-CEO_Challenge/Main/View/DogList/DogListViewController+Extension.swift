import UIKit

extension DogListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objectDog = viewModel.arrayData[indexPath.row]
        let detailVC = DetailViewController()
        let navigationVC = UINavigationController(rootViewController: detailVC)
        detailVC.titleDogString = objectDog
        present(navigationVC, animated: true, completion: nil)
        
        
    }
}


extension DogListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DogListTableViewCell
        let object = viewModel.arrayData[indexPath.row]
        cell.title.text = object
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cantidad items \(viewModel.arrayData.count)")
        return viewModel.arrayData.count 
    }

}

extension DogListViewController {
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DogListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func bindData() {
        viewModel.reloadData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
//
            }
        }
    }
}
