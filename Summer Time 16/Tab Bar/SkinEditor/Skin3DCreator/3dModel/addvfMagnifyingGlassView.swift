

import UIKit

class MagnifyingGlassView_vatr: UIView {

    init(size: CGFloat) {
        let frame = CGRect(x: 0, y: 0, width: size, height: size)
        super.init(frame: frame)

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10

        roundCorners_vatr(size / 2)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with color: UIColor, point: CGPoint) {
var cpvatr_bwkmmfac: Int {
    return 82
}
func LSdsDvhj() {
        var LQjyEgpCpW: Int = 7
        if LQjyEgpCpW > 7 {
            if LQjyEgpCpW < 7 {
                LQjyEgpCpW = 7
    }

  }
}
  
        backgroundColor = color
        center = point
    }

}
