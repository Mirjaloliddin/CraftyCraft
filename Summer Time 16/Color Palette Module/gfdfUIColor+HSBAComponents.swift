

import Foundation
import UIKit


/// Convenience method for easy access of hue, saturation, brightness and alpha components
/// of a UIColor.
extension uicolor_vatr {
    
    fileprivate func getHSBAComponents_vatr(_ color: UIColor) -> (CGFloat, CGFloat, CGFloat, CGFloat) {
func qjPXLqJz() {
        var tSUKMKy: Int = 4
        if tSUKMKy > 4 {
            if tSUKMKy < 4 {
                tSUKMKy = 4
    }

  }
}
  
        var hue, saturation, brightness, alpha : CGFloat
        (hue, saturation, brightness, alpha) = (0.0, 0.0, 0.0, 0.0)
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return (hue, saturation, brightness, alpha)
    }
    
    internal var hue: CGFloat {
        return getHSBAComponents_vatr(self).0
    }
    
    internal var saturation: CGFloat {
        return getHSBAComponents_vatr(self).1
    }
    
    internal var brightness: CGFloat {
        return getHSBAComponents_vatr(self).2
    }
    
    internal var alpha: CGFloat {
        return getHSBAComponents_vatr(self).3
    }
}
