class DogListPresenter: DogListPresenterProtocol {
    
    private let dogCEOUseCases: DogCeoUseCases
    private let dogNamesViewModelMapper: Mapper<DogNamesViewModel, DogList>
    weak var dogListView: DogListViewProtocol?
    
    init(dogCEOUseCases: DogCeoUseCases,
         dogNamesViewModelMapper: Mapper<DogNamesViewModel, DogList>)
    {
        self.dogCEOUseCases = dogCEOUseCases
        self.dogNamesViewModelMapper = dogNamesViewModelMapper
    }
    
    func getDogs() {
        dogCEOUseCases.execute { [weak self] response, error in
            guard let response = response, let self = self else {
                print("error")
                return
            }
            let dogs = self.dogNamesViewModelMapper.reverseMap(value: response)
            self.dogListView?.update(dogs: dogs)
        }
    }
    
}
