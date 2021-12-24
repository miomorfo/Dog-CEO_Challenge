class DogListViewModel {
    
    let network: ServiceDataSource
    
    init(serviceDS: ServiceDataSource) {
        self.network = serviceDS
        fetchData()
    }
    
    init() {
        network = ExternalService()
        fetchData()
    }
    
    var reloadData = { () -> () in }
    
    
    var arrayData: [DogModel] = [] {
        didSet {
            reloadData()
        }
    }
    
    private func fetchData() {
        network.getData { dogs in
            self.arrayData = dogs
        }
    }
}
