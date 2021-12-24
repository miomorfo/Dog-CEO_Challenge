import UIKit

class DogListTableViewCell: UITableViewCell {
    

    @IBOutlet weak var leading: NSLayoutConstraint! {
        didSet {
            leading.constant = DogViewCell.titleLeading
        }
    }
    
    @IBOutlet weak var trailing: NSLayoutConstraint! {
        didSet {
            trailing.constant = DogViewCell.titleTrailing
        }
    }
    @IBOutlet weak var top: NSLayoutConstraint! {
        didSet {
            top.constant = DogViewCell.titleTop
        }
    }
    @IBOutlet weak var bottom: NSLayoutConstraint! {
        didSet {
            bottom.constant = DogViewCell.titleBottom
        }
    }
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
