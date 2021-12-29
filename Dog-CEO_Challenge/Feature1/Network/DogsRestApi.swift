
protocol DogsRestApi {
    func getDogNames(completion: @escaping (DogList?, ErrorModel?) -> Void)
}
