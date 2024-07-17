
import UIKit

extension uiview_vatr {
    func configureShadow_vatr(cornerRadius: CGFloat = 9) {

        layer.backgroundColor = #colorLiteral(red: 0, green: 0.5039636493, blue: 0.9511538148, alpha: 1)
        layer.cornerRadius = cornerRadius
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 4)
//        layer.shadowOpacity = 0.3
//        layer.shadowRadius = 4
//        layer.borderColor = UIColor.white.cgColor
//        layer.borderWidth = 4
        
        if let borderLayer = layer.sublayers?.first(where: { $0.accessibilityLabel == "shadowLayer" }) {
            
//            borderLayer.frame = self.bounds
//            borderLayer.shadowPath = .init(rect: .init(x: 0, y: 0, width: self.bounds.width, height: 2), transform: nil)
            
        } else {
            // Border layer
            let shadowLayer = CALayer()
            
//            shadowLayer.frame = bounds
//            shadowLayer.cornerRadius = cornerRadius
//            shadowLayer.accessibilityLabel = "shadowLayer"
//            
//            shadowLayer.shadowColor = UIColor.black.cgColor
//            shadowLayer.shadowRadius = 3
//            shadowLayer.shadowOpacity = 1
//            shadowLayer.shadowOffset = .zero
//            shadowLayer.masksToBounds = true
//            shadowLayer.shadowPath = .init(rect: .init(x: 0, y: 0, width: bounds.width, height: 2), transform: nil)
            
//            layer.addSublayer(shadowLayer)
        }
        
        
    }
}


extension uiTextField_vatr {
    func setLeftPaddingPoints_vatr(_ amount:CGFloat){
  
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints_vatr(_ amount:CGFloat) {

  
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
