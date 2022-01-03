struct DogCeoDetailUseCases {
    
    private let dogsRepository: DogsRepository
    
    init(dogsRepository: DogsRepository) {
        self.dogsRepository = dogsRepository
    }
    
    func execute(name: String, completion: @escaping (DogDetail?, ErrorModel?) -> Void) {
        dogsRepository.getDogDetail(name: name) { response, error in
            if let response = response {
                completion(response, nil)
            }else {
                completion(nil, error)
            }
        }
    }
      
}
