
protocol DogsRestApi {
    func getDogNames(completion: @escaping (DogList?, ErrorModel?) -> Void)
    func getDogImages(name: String, completion: @escaping (DogDetail?, ErrorModel?) -> Void)
}
