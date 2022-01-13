@testable import Dog_CEO_Challenge

class DogRepositoryMock: DogsRepository {
    var success = false
    var dogListCalled = false
    var dogImagesCalled = false
    
    func getDogList(completion: @escaping (DogList?, ErrorModel?) -> Void) {
        dogListCalled = true
        if success {
            completion(generateDogListModel(), nil)
        } else {
            completion(nil, generateErrorModel())
        }
    }
    
    func getDogDetail(name: String, completion: @escaping (DogDetail?, ErrorModel?) -> Void) {
        dogImagesCalled = true
        if success {
            completion(generateDogDetail(), nil)
            
        }else {
            completion(nil, generateErrorModel())
        }
    }
    
    
    
    private func generateErrorModel() -> ErrorModel {
        return ErrorModel(error: "Error")
    }
    
    private func generateDogListModel() -> DogList {
        return DogList(
            message: [
                "affenpinscher",
                "african",
                "airedale",
                "akita",
                "appenzeller"])
    }
    
    private func generateDogDetail() -> DogDetail {
        return DogDetail(
            message: [
                "https://images.dog.ceo/breeds/beagle/1271553739_Milo.jpg",
                "https://images.dog.ceo/breeds/beagle/1374053345_Milo.jpg",
                "https://images.dog.ceo/breeds/beagle/166407056_Milo.jpg",
                "https://images.dog.ceo/breeds/beagle/184369380_Milo.jpg"])
    }
    
    
}
