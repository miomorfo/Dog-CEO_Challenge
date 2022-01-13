@testable import Dog_CEO_Challenge
import UIKit

class DogListViewMock: DogListViewProtocol {
    var updateCalled = false
    
    func update(dogs: DogNamesViewModel) {
        updateCalled = true
    }
}
