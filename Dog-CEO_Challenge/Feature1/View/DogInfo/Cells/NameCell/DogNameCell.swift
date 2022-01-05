import UIKit

class DogNameCell: UITableViewCell {
    
    static let identifier = DogNameCellConstants.identifier
    private var title = UILabel()
    
    
    func prepare() {
        prepareTitle()
    }
    private func prepareTitle() {
        title.numberOfLines = .zero
        contentView.addAutoLayout(subview: title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        //TODO: move to constans
        title.text = DogNameCellConstants.Texts.title
        title.textAlignment = .center
    }
}
