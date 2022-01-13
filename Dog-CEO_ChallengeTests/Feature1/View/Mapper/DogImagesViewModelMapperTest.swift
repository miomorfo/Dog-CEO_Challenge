@testable import Dog_CEO_Challenge
import XCTest

class DogImagesViewModelMappertest: XCTestCase {
    
    var sut: Mapper<DogImagesViewModel, DogDetail>!
    
    override func setUp() {
        super.setUp()
        sut = DogImagesViewModelMapper()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testReverseMap() {
        let model = DogDetail(
            message: [
            "https://images.dog.ceo/breeds/beagle/Joey.jpg",
            "https://images.dog.ceo/breeds/beagle/Phoebe.jpg"
            ])
        let imageModel = DogImagesViewModel(dogImages: [
            "https://images.dog.ceo/breeds/beagle/Joey.jpg",
            "https://images.dog.ceo/breeds/beagle/Phoebe.jpg"
            ])
        
        let viewModel = sut.reverseMap(value: model)
        
        for index in 0 ..< viewModel.dogImages.count {
            let image = viewModel.dogImages[index]
            let imageToView = imageModel.dogImages[index]
            
            XCTAssertEqual(image, imageToView)
        }
    }
}
