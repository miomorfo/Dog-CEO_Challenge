@testable import Dog_CEO_Challenge
import UIKit

class DogDetailViewMock: DogDetailViewProtocol {
    var showImageCalled = false
    func showImages(images: DogImagesViewModel) {
        showImageCalled = true
    }
}
