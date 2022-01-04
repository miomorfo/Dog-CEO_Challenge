import UIKit
class DogCeoViewFactory {
    private let dogCeoServiceLocator: DogCeoServiceLocator
    
    init(dogCeoServiceLocator: DogCeoServiceLocator) {
        self.dogCeoServiceLocator = dogCeoServiceLocator
    }
    
    var dogList: DogListViewController {
        let presenter = DogListPresenter(
            dogCEOUseCases: dogCeoServiceLocator.dogCeoUseCases,
            dogNamesViewModelMapper: dogCeoServiceLocator.dogNamesViewModelMapper
        )
        let viewController = DogListViewController(
            delegate: DogListDelegate(),
            dataSource: DogListDataSource(),
            presenter: presenter
        )
        presenter.dogListView = viewController
        return viewController
        
        
//        return DogListViewController(
//            delegate: DogListDelegate(),
//            dataSource: DogListDataSource(),
//            presenter: DogListPresenter(
//                dogCEOUseCases: dogCeoServiceLocator.dogCeoUseCases,
//                dogNamesViewModelMapper: dogCeoServiceLocator.dogNamesViewModelMapper
//            ))
    }
    
    var dogDetail: DetailViewController {
        let presenter = DogDetailPresenter(
            dogCeoDetailUseCases: dogCeoServiceLocator.dogCeoDetailUseCases,
            dogImagesViewModelMapper: dogCeoServiceLocator.dogImagesViewModelMapper
        )
        let viewController = DetailViewController(
            delegate: DogDetailDelegate(),
            dataSource: DogDetailDataSource(),
            presenter: presenter
        )
        presenter.dogDetailView = viewController
        return viewController
    }
    
    func viewController(type: ViewDogType) -> UIViewController {
        switch type {
        case .list:
            return dogList
        case .detail:
            return dogDetail
        }
    }
}
