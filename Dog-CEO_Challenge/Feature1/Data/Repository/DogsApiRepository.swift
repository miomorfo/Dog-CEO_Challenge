
class DogApiRepository: DogsRepository {
    
    let dogsRestApi : DogsRestApi
    
    init(dogsRestApi : DogsRestApi ) {
        self.dogsRestApi = dogsRestApi
    }
    
    func getDogList(completion: @escaping (DogList?, ErrorModel?) -> Void) {
        dogsRestApi.getDogNames { response, error in
            completion(response, error)
        }
    }
}
