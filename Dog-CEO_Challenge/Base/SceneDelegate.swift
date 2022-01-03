import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        let serviceLocator =  DogCeoServiceLocator()
        let presenter =  DogListPresenter(
            dogCEOUseCases: serviceLocator.dogCEOUseCases,
            dogNamesViewModelMapper: serviceLocator.dogNamesViewModelMapper
        )
        let dataSource = DogListDataSource()
        let delegate = DogListDelegate()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let dogListViewController = DogListViewController(delegate: delegate, dataSource: dataSource, presenter: presenter)
        presenter.dogListView = dogListViewController
        let navigationVC = UINavigationController(rootViewController: dogListViewController)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        
        //        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) { }
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

