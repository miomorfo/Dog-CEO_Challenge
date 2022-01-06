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
        return cell
    }
    
    private func prepareDescriptionCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell  {
        let cell: DogDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CustomDescriptionCell") as! DogDescriptionCell
        cell.prepare()
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell =  UITableViewCell()
        
        let cellTypeForSection = cellTypes[indexPath.section]
        
        switch cellTypeForSection {
        case .title:
            cell = prepareTitleCell(tableView, indexPath: indexPath)
        case .picture:
            cell = UITableViewCell()
        case .info:
            cell = prepareDescriptionCell(tableView, indexPath: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    
    
    
}
