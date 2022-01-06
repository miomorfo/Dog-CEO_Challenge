import UIKit

class DogDescriptionCell: UITableViewCell {
    
    static let identifier = "CustomDescriptionCell"
    
    private var dogDescription = UILabel()
    
    func prepare() {
        prepareDescription()
    }
    
    private func prepareDescription() {
        contentView.addAutoLayout(subview: dogDescription)
        
        NSLayoutConstraint.activate([
            dogDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dogDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dogDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dogDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        dogDescription.text = """
perrito ipsum dolor sit amet, consectetur adipiscing elit. Nunc eu ex non velit faucibus convallis id sed nisi. Proin id arcu ultricies, varius nisi non, consectetur dui. Aenean venenatis, enim nec ultrices dapibus
"""
//        dogDescription.textAlignment = .center
        dogDescription.numberOfLines = 0
    }
}
