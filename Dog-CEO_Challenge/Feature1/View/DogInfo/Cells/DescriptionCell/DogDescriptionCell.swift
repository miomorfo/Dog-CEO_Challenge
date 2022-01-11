import UIKit

class DogDescriptionCell: UITableViewCell {
    
    static let identifier = DogDescriptionCellConstants.identifier
    
    private var dogDescription = UILabel()
    
    func prepare() {
        prepareDescription()
    }
    
    private func prepareDescription() {
        contentView.addAutoLayout(subview: dogDescription)
        
        NSLayoutConstraint.activate([
            dogDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DogDescriptionCellConstants.CellMargins.top),
            dogDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: DogDescriptionCellConstants.CellMargins.bottom),
            dogDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: DogDescriptionCellConstants.CellMargins.trailing),
            dogDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DogDescriptionCellConstants.CellMargins.leading)
        ])
        
        dogDescription.text = DogDescriptionCellConstants.Texts.description
//        dogDescription.textAlignment = .center
        dogDescription.numberOfLines = 0
    }
}
