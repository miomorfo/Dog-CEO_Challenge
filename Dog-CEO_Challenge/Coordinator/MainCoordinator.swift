import UIKit

class MainCoordinator: Coordinator {

    
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        let viewController = ViewControllerFactory.viewController(type: .list) as! DogListViewController
        viewController.coordinator = self
        navigationController = UINavigationController(rootViewController: viewController)
    }
    
    func goToDetailView(name: String) {
        
        guard let viewController = ViewControllerFactory.viewController(type: .detail) as? DetailViewController else { return }
        viewController.titleDogString = name
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToinfoView(name: String, url: String) {
        guard  let viewController = ViewControllerFactory.viewController(type: .info) as? DogInfoViewController else { return }
        viewController.dogName = name
        viewController.dogUrl = url
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
