import UIKit

class DogInfoDelegate: NSObject {
    weak var viewController: DogInfoViewController?
    var cellTypes: [DogInfoCellType] = DogInfoCellType.default
}

extension DogInfoDelegate: UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        switch cellTypes[indexPath.section] {
    //        case .button:
    //
    //        case .title, .info, .picture, .spacer:
    //
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch cellTypes[indexPath.section] {
        case .picture:
            return 200
        case .title, .info, .button, .spacer:
            return self.tableView(tableView, estimatedHeightForRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

