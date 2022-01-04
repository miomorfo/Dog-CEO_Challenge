import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { set get }
    func start()
}
