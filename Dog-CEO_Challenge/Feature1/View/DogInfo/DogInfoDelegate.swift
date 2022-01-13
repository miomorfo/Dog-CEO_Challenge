import UIKit

class DogInfoDelegate: NSObject {
    weak var viewController: DogInfoViewController?
    var cellTypes: [DogInfoCellType] = DogInfoCellType.default
}

extension DogInfoDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch cellTypes[indexPath.row] {
        case .picture:
            return 200
        case .title, .info, .button, .spacer:
            return UITableView.automaticDimension
        
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

