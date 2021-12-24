import Foundation
import Alamofire

protocol ServiceDataSource {
    func getData(completion: @escaping([DogModel]) -> ())
}

class ExternalService: ServiceDataSource {
    var arrayDogs = [DogModel]()
    
    
    
    func getData(completion: @escaping ([DogModel]) -> ()) {
        let url  = Enpoints.urlBase + Enpoints.enpoints.list
        Alamofire.request(url).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 200 {
                    print("RESPONSE -> \(response)")
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        self.arrayDogs = try decoder.decode([DogModel].self, from: data)
                        completion(self.arrayDogs)
                    }catch {
                        print("error decoding JSON!!!")
                    }
                }
            }
        }
    }
}
