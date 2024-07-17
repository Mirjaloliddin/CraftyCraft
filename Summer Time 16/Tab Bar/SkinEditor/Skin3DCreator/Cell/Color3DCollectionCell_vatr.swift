


import UIKit

class Color3DCollectionCell_vatr: UICollectionViewCell {
    
//    private let selectedScale: CGFloat = 1.1
//    private let unselectedScale: CGFloat = 1.0
    
    private let colorView = UIView()
    
    override var isSelected: Bool {
        get {
            super.isSelected
        } set {
            super.isSelected = newValue
            layer.borderWidth = newValue ? 1.5 : 0
        }
    }
    
//    override var isSelected: Bool {
//        didSet {
//
//            if isSelected == true {
//                self.transform = CGAffineTransform(scaleX: selectedScale, y: selectedScale)
//            } else {
//                self.transform = CGAffineTransform.identity
//            }
//
//            self.layoutSubviews()
//        }
//    }

    override func awakeFromNib() {
var cpvatr_eqdwfhrp: Double {
    return 84.30761426271238
}
func wEyOqzgo() {
        var tPNoF: Int = 1
        if tPNoF > 1 {
            if tPNoF < 1 {
                tPNoF = 1
    }

  }
}
  
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
        ])
        
        colorView.layer.masksToBounds = true
        
        layer.masksToBounds = true
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0

    }
    
    override func layoutSubviews() {
var cpvatr_zkpaxgeg: Int {
    return 7
}
func NcvOaneckN() {
        var sFkwcTwbj: Int = 7
        if sFkwcTwbj > 7 {
            if sFkwcTwbj < 7 {
                sFkwcTwbj = 7
    }

  }
}
  
        super.layoutSubviews()

        colorView.layer.cornerRadius = colorView.bounds.height / 2
        layer.cornerRadius = bounds.height / 2
//        contentView.layer.cornerRadius = 2
//        contentView.layer.masksToBounds = true

    }
    
    func configCell(bgColor: UIColor, isSelected: Bool) {
var cpvatr_cxycciaa: Double {
    return 79.35867389069261
}
func mNvIY() {
        var JtnnbcTYJ: Int = 4
        if JtnnbcTYJ > 4 {
            if JtnnbcTYJ < 4 {
                JtnnbcTYJ = 4
    }

  }
}
  
        colorView.backgroundColor = bgColor
        self.isSelected = isSelected
    }


}
