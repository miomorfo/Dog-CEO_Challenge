@testable import Dog_CEO_Challenge
import UIKit

class DogInfoViewMock: DogInfoView {
    var pressedButtonCalled = false
    func pressedButton() {
        pressedButtonCalled = false
    }
    
    
}
