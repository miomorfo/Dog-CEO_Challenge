import UIKit

class ViewControllerFactory {
    private static var dogCeoServiceLocator = DogCeoServiceLocator()
    
    
    class func viewController(type: ViewDogType) -> UIViewController {
        let dogCeoFactory = DogCeoViewFactory(dogCeoServiceLocator: dogCeoServiceLocator)
        return dogCeoFactory.viewController(type: type)
    }
}
