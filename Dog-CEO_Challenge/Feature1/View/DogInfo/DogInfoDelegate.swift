import UIKit

class DogInfoDelegate: NSObject {
    weak var viewController: DogInfoViewController?
    var cellTypes: [DogInfoCellType] = DogInfoCellType.default
}

extension DogInfoDelegate: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch cellTypes[indexPath.section] {
//        case .button:
//            print("click button!")
//        case .title, .info, .picture, .spacer:
//            print("OTROS")
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return self.tableView(tableView, estimatedHeightForRowAt: indexPath)
        }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    }

