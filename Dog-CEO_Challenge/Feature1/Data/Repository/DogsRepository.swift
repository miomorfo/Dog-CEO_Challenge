protocol DogsRepository {
    func getDogList(completion: @escaping (DogList?, ErrorModel?) -> Void)
}

