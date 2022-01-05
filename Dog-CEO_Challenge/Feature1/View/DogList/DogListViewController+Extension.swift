import UIKit

extension DogListViewController: DogListViewProtocol {
    func update(dogs: DogNamesViewModel) {
        viewModel = dogs
        tableView.reloadData()
    }
//
//    func goToDetailView(name: String) {
        
//        let serviceLocator =  DogCeoServiceLocator()
//        let presenter =  DogDetailPresenter(
//            dogCeoDetailUseCases: serviceLocator.dogCeoDetailUseCases,
//            dogImagesViewModelMapper: serviceLocator.dogImagesViewModelMapper
//        )
//        let dataSource = DogDetailDataSource()
//        let delegate = DogDetailDelegate()
//
//        let detailViewController = DetailViewController(delegate: delegate, dataSource: dataSource, presenter: presenter)
//        presenter.dogDetailView = detailViewController
//        detailViewController.titleDogString = name
//
//        navigationController?.pushViewController(detailViewController, animated: true)
        
       
//        let viewController = ViewControllerFactory.viewController(type: .detail) as! DetailViewController
//        viewController.titleDogString = name
//        navigationController?.pushViewController(viewController, animated: true)
//
//    }
}
