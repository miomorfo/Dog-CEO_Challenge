import Foundation
import Alamofire

protocol ServiceDataSource {
    func getData(completion: @escaping(DogModel) -> ())
    func getDetail(name: String, completion: @escaping(DogModel) -> ())
}

class ExternalService: ServiceDataSource {
    
    func getData(completion: @escaping (DogModel) -> ()) {
        let url  = Enpoints.urlBase + Enpoints.enpoints.list
        Alamofire.request(url).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 200 {
                    #if DEBUG
                    print("RESPONSE -> (\n) \(response)")
                    #endif
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let arrayDogs = try decoder.decode(DogModel.self, from: data)
                            completion(arrayDogs)
                    }catch {
                        #if DEBUG
                        print("error decoding JSON!!!")
                        #endif
                    }
                }
            }
        }
    }
    
    func getDetail(name: String, completion: @escaping (DogModel) ->()) {
        let replaced = Enpoints.enpoints.detail.replacingOccurrences(of: "{name}", with: name)
        let url = Enpoints.urlBase + replaced
        Alamofire.request(url).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 200 {
                    #if DEBUG
                    print("RESPONSE -> (\n) \(response)")
                    #endif
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let arrayDogs = try decoder.decode(DogModel.self, from: data)
                            completion(arrayDogs)
                    }catch {
                        #if DEBUG
                        print("error decoding JSON!!!")
                        #endif
                    }
                }
            }
        }
    }
}
