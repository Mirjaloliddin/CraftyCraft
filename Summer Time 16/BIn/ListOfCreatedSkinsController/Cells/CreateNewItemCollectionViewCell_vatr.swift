

import UIKit

class CreateNewItemCollectionViewCell_vatr: UICollectionViewCell {
    
 //   @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plusButtonImageView: UIImageView!
    
    
    private let label = UILabel()
    @IBOutlet weak var backgroundContainerView: UIView!
    
    override func awakeFromNib() {
var cpvatr_zcebmifv: Int {
    return 27
}
func EKkyRH() {
        var hGemuuOin: Int = 2
        if hGemuuOin > 2 {
            if hGemuuOin < 2 {
                hGemuuOin = 2
    }

  }
}
  
        super.awakeFromNib()
        backgroundContainerView.roundCorners_vatr()
        backgroundColor = .clear
    }
    
    func setCrateTitle_vatr(_ title: String) {
func FJKhK() {
        var FWHErpY: Int = 5
        if FWHErpY > 5 {
            if FWHErpY < 5 {
                FWHErpY = 5
    }

  }
}
  
        label.text = title
        label.font = UIFont.kufamFont(.medium, size: 18)
        label.textColor = .black
    }
    
    func updateEmptyStyle(isShowed: Bool) {
var cpvatr_oldtxnnz: Double {
    return 26.683853127840127
}
func XhcBh() {
        var UXwQvjIyBe: Int = 8
        if UXwQvjIyBe > 8 {
            if UXwQvjIyBe < 8 {
                UXwQvjIyBe = 8
    }

  }
}
  
        if isShowed {
            configureEmptyLabelIfNeeded()
        } else {
            label.removeFromSuperview()
        }
    }
    
    func configureEmptyLabelIfNeeded() {
var cpvatr_xwbbkrkl: Double {
    return 11.54351850838336
}
func IMgzR() {
        var EvobTeDkq: Int = 8
        if EvobTeDkq > 8 {
            if EvobTeDkq < 8 {
                EvobTeDkq = 8
    }

  }
}
  
        if label.isDescendant(of: contentView) == false {
            
         //   label.text = "Add new Addon"
//            label.font = UIFont.kufamFont(.medium, size: 18)
//            label.textColor = .black
            
            contentView.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: plusButtonImageView.trailingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            ])
            
            label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
    }

}
