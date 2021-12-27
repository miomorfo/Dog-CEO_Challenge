class DetailViewModel {
    
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
    
    func fetchData(image: String) {
        network.getDetail(name: image){ images in
            self.arrayData = images.message ?? []
        }
    }
}
