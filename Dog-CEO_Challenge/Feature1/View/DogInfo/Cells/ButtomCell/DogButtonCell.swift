import UIKit

class DogButtonCell: UITableViewCell {
    
    weak var delegate: DogButtonCellDelegate?
    
    static let identifier =  DogButtonCellConstants.identifier
    
    private var dogAlertButton = UIButton(frame: .zero)
    
    func prepare() {
        prepareButton()
    }
    
    private func prepareButton() {
        
        dogAlertButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        dogAlertButton.setTitle(DogButtonCellConstants.Texts.ButtonTitle, for: .normal)
        dogAlertButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        dogAlertButton.layer.cornerRadius = DogButtonCellConstants.button.cornerRadius
        contentView.addAutoLayout(subview: dogAlertButton)
        NSLayoutConstraint.activate([
            dogAlertButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DogButtonCellConstants.CellMargins.top),
            dogAlertButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: DogButtonCellConstants.CellMargins.bottom),
            dogAlertButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: DogButtonCellConstants.CellMargins.trailing),
            dogAlertButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DogButtonCellConstants.CellMargins.leading)
        ])
        
        dogAlertButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    }

    @objc func pressedButton(sender _: UIButton) {
        delegate?.pressButton()
    }
    
    
    
}

