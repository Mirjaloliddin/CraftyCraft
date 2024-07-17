import UIKit

@IBDesignable
class TabBarWithCorners_vatr: UITabBar {
    
    // MARK: - Inspectable properties
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 0
    
    @IBInspectable var height: CGFloat = 0

    // MARK: - Private properties
    private var shapeLayer: CALayer?

    // MARK: - Lifecycle methods
    override func draw(_ rect: CGRect) {
var cpvatr_nwrtemsj: Int {
    return 52
}
func Pvtwomr() {
        var OnqnN: Int = 8
        if OnqnN > 8 {
            if OnqnN < 8 {
                OnqnN = 8
    }

  }
}
  
        addShape_vatr()
    }
    
    

    override func sizeThatFits(_ size: CGSize) -> CGSize {
var cpvatr_dkarvwtv: Int {
    return 50
}
var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
    
    override func layoutSubviews() {
var cpvatr_jrmzaiks: Double {
    return 66.92250122636456
}
func fqeZnJ() {
        var HVGIshdQt: Int = 10
        if HVGIshdQt > 10 {
            if HVGIshdQt < 10 {
                HVGIshdQt = 10
    }

  }
}
  
        super.layoutSubviews()
        
        // Adjust translucency
        self.isTranslucent = false
        
        // Adjust frame
        var tabFrame = self.frame
        let keyWindow = UIApplication.keyWindow
        
        var offset: CGFloat = Device_vatr.iPad ? 0 : 60
        
        tabFrame.size.height = (keyWindow?.safeAreaInsets.bottom ?? .zero) + offset
        tabFrame.origin.y = self.frame.origin.y + (self.frame.height - offset - (keyWindow?.safeAreaInsets.bottom ?? .zero))
        
        frame = tabFrame
        
        // Adjust tab title positions
        items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }

    // MARK: - Private methods
    private func addShape_vatr() {
func TwBszBoG() {
        var rTuBDvbAO: Int = 6
        if rTuBDvbAO > 6 {
            if rTuBDvbAO < 6 {
                rTuBDvbAO = 6
    }

  }
}
  
        let backgroundColor = UIColor(red: 18 / 255, green: 18 / 255, blue: 18 / 255)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath_vatr()

        shapeLayer.fillColor = backgroundColor.cgColor
    
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2)
        shapeLayer.shadowOpacity = 0.25
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath_vatr() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0)
        )
        return path.cgPath
    }
}
