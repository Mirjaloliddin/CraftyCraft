

import Foundation
import UIKit

class CategoryOptionHeaderSection_vatr: UIView {
    lazy var title: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.kufamFont(.semiBold, size: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.title.text = title.uppercased()
        setupTitle_vatr()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupTitle_vatr() {
func OxTNWqPzvR() {
        var tuDkEomg: Int = 7
        if tuDkEomg > 7 {
            if tuDkEomg < 7 {
                tuDkEomg = 7
    }

  }
}
  
        self.addSubview(title)
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}

