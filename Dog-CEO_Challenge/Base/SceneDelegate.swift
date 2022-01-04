import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let coordinator = MainCoordinator()
        coordinator.start()
        guard let windowScene = (scene as? UIWindowScene) else {return}
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
//        let viewController = ViewControllerFactory.viewController(type: .list)
//        let navigationVC = UINavigationController(rootViewController: viewController)
//        window?.rootViewController = navigationVC
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

