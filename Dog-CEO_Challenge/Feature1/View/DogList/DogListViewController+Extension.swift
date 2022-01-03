import UIKit

extension DogListViewController: DogListViewProtocol {
    func update(dogs: DogNamesViewModel) {
        viewModel = dogs
        tableView.reloadData()
    }
    
    func goToDetailView(name: String) {
        
        let serviceLocator =  DogCeoServiceLocator()
        let presenter =  DogDetailPresenter(
            dogCeoDetailUseCases: serviceLocator.dogCEODetailUseCases,
            dogImagesViewModelMapper: serviceLocator.dogImagesViewModelMapper
        )
        let dataSource = DogDetailDataSource()
        let delegate = DogDetailDelegate()
        
        let detailViewController = DetailViewController(delegate: delegate, dataSource: dataSource, presenter: presenter)
        detailViewController.titleDogString = name
        navigationController?.pushViewController(detailViewController, animated: true)

    }
}
