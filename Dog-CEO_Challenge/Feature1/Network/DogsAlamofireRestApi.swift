import Alamofire
import Foundation

class DogsAlamofireRestApi: DogsRestApi {
    func getDogNames(completion: @escaping (DogList?, ErrorModel?) -> Void) {
        let url = Enpoints.urlBase + Enpoints.enpoints.list
        Alamofire.request(url).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let arrayDogs = try decoder.decode(DogList.self, from: data)
                completion(arrayDogs, nil)
            }catch {
                let error = ErrorModel(error: "generic error ")
                completion(nil, error)
                
            }
        }
    }
}
