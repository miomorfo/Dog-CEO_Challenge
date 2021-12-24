class DogListViewModel {
    
    let network: ServiceDataSource
    
    init(serviceDS: ServiceDataSource = ExternalService()) {
        self.network = serviceDS
    }
    
    var reloadData = { () -> () in }
    
    var arrayData: [String] = [] {
        didSet {
            reloadData()
        }
    }
    
    func fetchData() {
        network.getData { dogs in
            self.arrayData = dogs.message ?? []
        }
    }
}
