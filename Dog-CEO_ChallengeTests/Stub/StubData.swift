@testable import Dog_CEO_Challenge


class StubData: ServiceDataSource {

    //FIX: delete this init
    var dogsData: DogModel = DogModel(message: [
                                        "affenpinscher",
                                        "african",
                                        "airedale",
                                        "akita",
                                        "appenzeller",
                                        "australian",
                                        "basenji"],
                             status: "success")
    
    func getData(completion: @escaping (DogModel) -> ()) {
        completion(dogsData)
    }
    
    func getDetail(name: String, completion: @escaping (DogModel) -> ()) {
        completion(dogsData)
    }
}
