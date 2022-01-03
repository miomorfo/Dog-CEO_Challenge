
struct DogCeoUseCases {
    private let dogsRepository: DogsRepository
    
    init(dogsRepository: DogsRepository) {
        self.dogsRepository = dogsRepository
    }
    
    func execute(completion: @escaping (DogList?, ErrorModel?) -> Void) {
        dogsRepository.getDogList { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
        
    }
}
