import XCTest
import Mimic
import Alamofire

extension XCTest {
    
    @discardableResult
    func mimic(request: @escaping MimicRequest, delay: TimeInterval = 0, response: @escaping MimicResponse) -> MimicObject{
        return Mimic.mimic(request: request, delay: delay, response: response)
    }
    
    func mimicRequest(method: MimicHTTPMethod, url: String, Wildcard: Bool) -> MimicRequest {
        request(with: method, url: url, wildCard: Wildcard)
    }
    
    func mimicResponse(jsonBody: Any, status: Int, headers: [String: String]) -> MimicResponse {
        return response(with: status, headers: headers)
    }
    
}
