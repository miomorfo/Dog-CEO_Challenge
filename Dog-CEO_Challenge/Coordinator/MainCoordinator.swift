import UIKit

class MainCoordinator: Coordinator {

    
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        let viewController = ViewControllerFactory.viewController(type: .list) as! DogListViewController
        viewController.coordinator = self
        navigationController = UINavigationController(rootViewController: viewController)
    }
    
    func goToDetailView(name: String) {
        
        let viewController = ViewControllerFactory.viewController(type: .detail) as! DetailViewController
        
        viewController.titleDogString = name
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
