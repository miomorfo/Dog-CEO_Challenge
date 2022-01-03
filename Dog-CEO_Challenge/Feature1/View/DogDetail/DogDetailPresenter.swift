class DogDetailPresenter: DogDetailPresenterProtocol {
    
    private let dogCeoDetailUseCases: DogCeoDetailUseCases
    private let dogImagesViewModelMapper: Mapper<DogImagesViewModel, DogDetail>
    weak var dogDetailView: DogDetailViewProtocol?
    
    init(dogCeoDetailUseCases: DogCeoDetailUseCases,
         dogImagesViewModelMapper: Mapper<DogImagesViewModel, DogDetail>)
    {
        self.dogCeoDetailUseCases = dogCeoDetailUseCases
        self.dogImagesViewModelMapper = dogImagesViewModelMapper
    }
    
    func getImages(name: String) {
        dogCeoDetailUseCases.execute(name: name) { [weak self] response, error in
            guard let response = response, let self = self else {
                print("error")
                return
            }
            let images = self.dogImagesViewModelMapper.reverseMap(value: response)
            self.dogDetailView?.showImages(images: images)
        }
    }
}
