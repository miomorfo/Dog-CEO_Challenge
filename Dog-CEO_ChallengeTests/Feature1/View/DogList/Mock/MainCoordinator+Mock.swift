@testable import Dog_CEO_Challenge


class MainCoordinatorMock: MainCoordinator {
    
    var goTodetailViewCalled = false
    
    override func goToDetailView(name: String) {
        goTodetailViewCalled = true
    }
    
    var goToInfoViewCalled = false
    
    override func goToinfoView(name: String, url: String) {
        goTodetailViewCalled = true
    }
}
