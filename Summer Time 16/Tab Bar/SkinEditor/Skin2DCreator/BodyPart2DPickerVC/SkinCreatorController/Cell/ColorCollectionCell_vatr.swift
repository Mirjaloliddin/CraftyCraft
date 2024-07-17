
import UIKit

class ColorCollectionCell_vatr: UICollectionViewCell {
    
    
    private let colorView = UIImageView()
    
    
//    override var isSelected: Bool {
//        get {
//            super.isSelected
//        } set {
//            super.isSelected = newValue
//            layer.borderWidth = newValue ? 1.5 : 0
//        }
//    }
    
    override func awakeFromNib() {
       
        
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1)
        ])
        
        
        
    }
    
    
    func configCell(bgColor: UIColor, isSelected: Bool) {
      
        
        colorView.image = .init(systemName: "square.fill")?.withRenderingMode(.alwaysTemplate)
        colorView.tintColor = bgColor
        
        var background = UIBackgroundConfiguration.clear()
        background.cornerRadius = 2
        background.strokeColor = isSelected ? .white : .clear
       //  background.strokeOutset = -4
        background.strokeWidth = 1
        
        
        backgroundConfiguration = background
        configurationUpdateHandler = { cell, state in
            
            if state.isSelected || state.isHighlighted {
                cell.backgroundConfiguration?.strokeColor = .black
                cell.backgroundConfiguration?.strokeOutset = 0
                
            } else {
                cell.backgroundConfiguration?.strokeColor = bgColor == .white ? .systemGray5 : .clear
//                cell.backgroundConfiguration?.strokeOutset = bgColor == .white ? -1 : 0
            }
        }
        
        
//        colorView.image = .init(systemName: "circle.fill")?.withRenderingMode(.alwaysTemplate)
//        colorView.tintColor = bgColor
        self.isSelected = isSelected
        
//        if bgColor == .white {
//            colorView.layer.borderColor = UIColor.systemGray6.cgColor
//            colorView.layer.borderWidth = 1
//            colorView.layer.cornerRadius = colorView.bounds.height / 2
//            colorView.layer.masksToBounds = true
//        } else {
//            colorView.layer.borderWidth = 0
//        }
    }
    
    
}
