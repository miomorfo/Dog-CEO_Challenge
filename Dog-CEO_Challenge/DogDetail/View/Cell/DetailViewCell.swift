import UIKit

class DetailViewCell: UITableViewCell {
    
    @IBOutlet weak var imageDog: UIImageView!
    @IBOutlet weak var imageTop: NSLayoutConstraint! {
        didSet {
            imageTop.constant = DetailViewConstans.DetailImageViewCell.imageTop
        }
    }
    @IBOutlet weak var imageBottom: NSLayoutConstraint! {
        didSet {
            imageBottom.constant = DetailViewConstans.DetailImageViewCell.imageBottom
        }
    }
    @IBOutlet weak var imageTrailing: NSLayoutConstraint! {
        didSet {
            imageTrailing.constant = DetailViewConstans.DetailImageViewCell.imageTrailing
        }
    }
    @IBOutlet weak var imageLeading: NSLayoutConstraint! {
        didSet {
            imageLeading.constant = DetailViewConstans.DetailImageViewCell.imageLeading
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
