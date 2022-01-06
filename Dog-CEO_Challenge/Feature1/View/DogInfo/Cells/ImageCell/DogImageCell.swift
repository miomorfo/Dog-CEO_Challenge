import UIKit

class DogImageCell: UITableViewCell {
    
    static let identifier =  "CustomImageCell"
    var urlString: String = ""
    private var imageViewDog = UIImageView(frame: .zero)
    private let imagePerro = UIImage(named: "perrito.jpg")

    
    func prepare() {
        prepareImage()
//        loadUrlToImage()
    }
    
    func loadUrlToImage() {
        let url = URL(string: urlString)
        imageViewDog.load(url: url!)
    }
    
    private func prepareImage() {
        contentView.addAutoLayout(subview: imageViewDog)
        imageViewDog.image = imagePerro
        imageViewDog.translatesAutoresizingMaskIntoConstraints = false
        
//        imageViewDog.contentMode = .scaleAspectFill
        imageViewDog.contentMode = .scaleAspectFit
        imageViewDog.clipsToBounds = true

        NSLayoutConstraint.activate([
            imageViewDog.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageViewDog.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageViewDog.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageViewDog.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
}
