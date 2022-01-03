protocol DogsRepository {
    func getDogList(completion: @escaping (DogList?, ErrorModel?) -> Void)
    func getDogDetail(name: String, completion: @escaping (DogDetail?, ErrorModel?) -> Void)
}

