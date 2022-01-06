import UIKit

class DogNameCell: UITableViewCell {
    
    static let identifier = DogNameCellConstants.identifier
     var title = UILabel()

        
    func prepare() {
        prepareTitle()
    }
    private func prepareTitle() {
        title.numberOfLines = .zero
        contentView.addAutoLayout(subview: title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DogNameCellConstants.CellMargins.top),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: DogNameCellConstants.CellMargins.bottom),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DogNameCellConstants.CellMargins.leading),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: DogNameCellConstants.CellMargins.trailing)
        ])
        
//        title.text = DogNameCellConstants.Texts.title
        title.textAlignment = .center
    }
}
