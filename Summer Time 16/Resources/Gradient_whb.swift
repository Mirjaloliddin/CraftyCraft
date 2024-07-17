import Foundation
import QuartzCore
import UIKit

class Gradient {
    static func setupGradient(view: UIView,colors: [Any] = [#colorLiteral(red: 0, green: 0.8705882353, blue: 0.9607843137, alpha: 1).cgColor, #colorLiteral(red: 0.06666666667, green: 0.03921568627, blue: 0.9137254902, alpha: 1).cgColor] ) {
        var gradient = CAGradientLayer()
        gradient.colors = colors
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.bounds
        view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    static func setupGradientForBorderColor(view: UIView,borderWidth: CGFloat) {
     
        let gradient = CAGradientLayer()
                gradient.colors = [
                    #colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1).cgColor,
                    #colorLiteral(red: 0.7239795918, green: 0.7959121148, blue: 0.9981217487, alpha: 1).cgColor
                ]
                gradient.startPoint = CGPoint(x: 0.5, y: 0)
                gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradient.frame = view.bounds
        

                let shapeLayer = CAShapeLayer()
                shapeLayer.lineWidth = borderWidth
                shapeLayer.path = UIBezierPath(rect: view.bounds).cgPath
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.strokeColor = UIColor.black.cgColor
                gradient.mask = shapeLayer

                shapeLayer.cornerRadius = view.layer.cornerRadius
                view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
                view.layer.insertSublayer(gradient, at: 0)
        
        
    }
    static func setupButtonGradient(view: UIView) {
        var gradient = CAGradientLayer()
        gradient.colors = [
            #colorLiteral(red: 0.03137254902, green: 0.431372549, blue: 0.937254902, alpha: 1).cgColor,
            #colorLiteral(red: 0.07843137255, green: 0.1058823529, blue: 0.9215686275, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.bounds
        view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        view.layer.insertSublayer(gradient, at: 0)
    }
   
}

class GradientButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Gradient.setupButtonGradient(view: self)
    }
    
    
}


extension UIView {
    func applyGradientBorder(colors: [UIColor], borderWidth: CGFloat, startPoint: CGPoint = CGPoint(x: 0.5, y: 0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = colors.map { $0.cgColor }
           gradientLayer.startPoint = startPoint
           gradientLayer.endPoint = endPoint
           gradientLayer.frame = self.bounds
           
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = borderWidth
           shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
           shapeLayer.fillColor = UIColor.clear.cgColor
           shapeLayer.strokeColor = UIColor.black.cgColor
           gradientLayer.mask = shapeLayer
        gradientLayer.cornerRadius = 24
           self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
           self.layer.insertSublayer(gradientLayer, at: 0)
       }
}
