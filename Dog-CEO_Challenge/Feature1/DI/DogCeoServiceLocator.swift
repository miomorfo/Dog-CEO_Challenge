
class DogCeoServiceLocator {
    
    private var dogsRestApi: DogsRestApi {
        return DogsAlamofireRestApi()
    }
    
    private var dogsRepository : DogsRepository {
        return DogApiRepository(dogsRestApi: dogsRestApi)
    }
   
    var dogCEOUseCases: DogCeoUseCases {
        return DogCeoUseCases(dogsRepository: dogsRepository)
    }
    
    var dogCEODetailUseCases: DogCeoDetailUseCases {
        return DogCeoDetailUseCases(dogsRepository: dogsRepository)
    }
    
    var dogNamesViewModelMapper: Mapper<DogNamesViewModel, DogList> {
        return DogNamesViewModelMapper()
    }
    
    var dogImagesViewModelMapper: Mapper<DogImagesViewModel, DogDetail> {
        return DogImagesViewModelMapper()
    }
}
