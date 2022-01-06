import UIKit

class DogImageCell: UITableViewCell {
    
    static let identifier =  "CustomImageCell"

    
    private var imageViewDog = UIImageView()

    
    func prepare() {
        
    }
    
    private func prepareImage() {
        contentView.addAutoLayout(subview: imageViewDog)
        
        NSLayoutConstraint.activate([
            imageViewDog.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageViewDog.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageViewDog.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageViewDog.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
}
