@testable import Dog_CEO_Challenge
import XCTest

class DogNamesViewModelMapperTest: XCTestCase {
    
    var sut: Mapper<DogNamesViewModel, DogList>!
    
    override func setUp() {
        super.setUp()
        sut = DogNamesViewModelMapper()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testReverseMap() {
        let model = DogList(message: ["perro 1","perro 2"])
        let nameModel = DogNamesViewModel(dogNames: ["perro 1","perro 2"])
        let viewModel = sut.reverseMap(value: model)
        
        for index in 0 ..< viewModel.dogNames.count {
            let name = viewModel.dogNames[index]
            let nametoView = nameModel.dogNames[index]
            
            XCTAssertEqual(name, nametoView)
        }
        
        
    }
}
