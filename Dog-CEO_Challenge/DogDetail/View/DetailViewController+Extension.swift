import UIKit

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailViewCell
        let object = viewModel.arrayData[indexPath.row]
        let url = URL(string: object)!
        cell.imageDog.load(url: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #if DEBUG
        print("cantidad imagenes del perro \(viewModel.arrayData.count)")
        #endif
        return viewModel.arrayData.count
    }
    

    
}

extension DetailViewController {
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func bindData() {
        viewModel.reloadData = { [weak self] () in
//            DispatchQueue.main.async {
                self?.tableView.reloadData()
                //
//            }
        }
    }
}



