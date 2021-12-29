
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
    
    var dogNamesViewModelMapper: Mapper<DogNamesViewModel, DogList> {
        return DogNamesViewModelMapper()
    }
}
