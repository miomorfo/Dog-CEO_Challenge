import UIKit

class DogButtonCell: UITableViewCell {
    
    weak var delegate: DogButtonCellDelegate?
    
    static let identifier =  "CustomButtonCell"
    
    private var dogAlertButton = UIButton(frame: .zero)
    
    func prepare() {
        prepareButton()
    }
    
    private func prepareButton() {
        
        dogAlertButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        dogAlertButton.setTitle("Alert Dog", for: .normal)
        dogAlertButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        dogAlertButton.layer.cornerRadius = 10
        contentView.addAutoLayout(subview: dogAlertButton)
        NSLayoutConstraint.activate([
            dogAlertButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            dogAlertButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            dogAlertButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dogAlertButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        dogAlertButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    }

    @objc func pressedButton(sender _: UIButton) {
        delegate?.pressButton()
    }
    
    
    
}

