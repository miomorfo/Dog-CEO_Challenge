import UIKit

class DogInfoDataSource: NSObject {
    weak var viewController: DogInfoViewController?
    var cellTypes: [DogInfoCellType] = DogInfoCellType.default
    
    override init(){}
}

extension DogInfoDataSource: UITableViewDataSource {

    
    
    private func prepareTitleCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: DogNameCell = tableView.dequeueReusableCell(withIdentifier: "CustomTitleCell") as! DogNameCell
        cell.prepare()
        cell.title.text = viewController?.dogName
        return cell
    }
    
    private func prepareDescriptionCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell  {
        let cell: DogDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CustomDescriptionCell") as! DogDescriptionCell
        cell.prepare()
        return cell
    }
    
    private func prepareImageCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell  {
        let cell: DogImageCell = tableView.dequeueReusableCell(withIdentifier: "CustomImageCell") as! DogImageCell
        cell.urlString = viewController?.dogUrl ?? "https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2021/02/17/gen.jpeg"
        cell.prepare()
        return cell
    }
    
    private func prepareButtonCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell  {
        let cell: DogButtonCell = tableView.dequeueReusableCell(withIdentifier: "CustomButtonCell") as! DogButtonCell
        cell.delegate = viewController
        cell.prepare()
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell =  UITableViewCell()
        
        let cellTypeForSection = cellTypes[indexPath.row]
        
        switch cellTypeForSection {
        case .title:
            cell = prepareTitleCell(tableView, indexPath: indexPath)
        case .picture:
            cell = prepareImageCell(tableView, indexPath: indexPath)
        case .info:
            cell = prepareDescriptionCell(tableView, indexPath: indexPath)
        case .button:
            cell = prepareButtonCell(tableView, indexPath: indexPath)
        case .spacer:
            cell = UITableViewCell()
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }

}
