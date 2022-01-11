import UIKit

class DogImageCell: UITableViewCell {
    
    static let identifier =  DogImageCellConstants.identifier
    var urlString: String = DogImageCellConstants.empty
    private var imageViewDog = UIImageView(frame: .zero)
    private let imagePerro = UIImage(named: DogImageCellConstants.Texts.placeholder)

    
    func prepare() {
        prepareImage()
        loadUrlToImage()
    }
    
    func loadUrlToImage() {
        let url = URL(string: urlString)
        imageViewDog.load(url: url!)
    }
    
    private func prepareImage() {
        contentView.addAutoLayout(subview: imageViewDog)
        imageViewDog.image = imagePerro
//        imageViewDog.contentMode = .scaleAspectFill
        imageViewDog.contentMode = .scaleAspectFit
        imageViewDog.clipsToBounds = true
        imageViewDog.backgroundColor = .blue

        NSLayoutConstraint.activate([
            imageViewDog.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DogImageCellConstants.CellMargins.top),
            imageViewDog.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: DogImageCellConstants.CellMargins.bottom),
            imageViewDog.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: DogImageCellConstants.CellMargins.trailing),
            imageViewDog.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DogImageCellConstants.CellMargins.leading)
        ])
    }
}
