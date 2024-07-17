

import UIKit

/// Ring view representing the hue.
 public class HueView_vatr: UIView {
    
    // MARK: - Private attributes.
    
    /// Horizontal offset for the start of the rectangle forming the hue ring.
     var offset_x: CGFloat = 0.0
    
    /// Vertical offset for the start of the rectangle forming the hue ring.
     var offset_y: CGFloat = 0.0
    
    /// Radius of the circular hue view.
     var radius: CGFloat
    
    /// Width of the small rectangles that form the hue ring.
     var borderWidth: CGFloat
    
    /// Height of the small rectangles that form the hue ring.
     var borderHeight: CGFloat
    
    /// The circular UI control that can be dragged around.
     var selector: UIView?
    
    /// Diameter of the selector.
     var selectorDiameter: CGFloat
    
    /// The scale at which the selector enlargens when the user clicks on it and holds it.
     var scale: CGFloat
    
    /// Wrapper View holding the ring UIView.
     var hueRingView: UIView?
    
    // MARK: Public attributes.
    
    /// Delegate that writes back changes of the hue value.
     var delegate: HueDelegate_vatr?
    
    // MARK: - Initializer.
     var dragGestureRecognizer = UIPanGestureRecognizer()
     var hueGestureRecognizer = UIPanGestureRecognizer()
    
    /// Initializes a new hue ring view.
    ///
    /// - TODO: borderHeight is currently hardcoded.
    /// - Parameters:
    ///   - frame: a CGRect that defines the dimensions of the view.
    ///   - borderWidth: width of the hue ring.
    ///   - selectorDiameter: diameter of the movable hue selector.
    ///   - scale: the scale at which the selector enlargens when it is clicked.
     init(frame: CGRect, borderWidth: CGFloat, selectorDiameter: CGFloat, scale: CGFloat) {
        self.borderWidth = borderWidth
        self.borderHeight = 5
        self.radius = (frame.width-borderWidth)/2
        self.scale = scale
        self.offset_x = (frame.width-borderWidth)/2
        self.offset_y = (frame.height-borderHeight)/2
        self.selectorDiameter = selectorDiameter
        super.init(frame: frame)
        
        createHueRing_vatr()
        createSelector_vatr()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper methods.
    
    /// Creates the selector which can be dragged around by the user.
     func createSelector_vatr() {
         var arewrafdfa: Double {
                 return 1 * 1
             }
  
        selector = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: selectorDiameter,
                                        height: selectorDiameter))
        
        selector?.center = CGPoint(x: (borderWidth)/2, y: offset_y)
        selector?.layer.cornerRadius = (selectorDiameter)/2
        selector?.isUserInteractionEnabled = true
        selector?.layer.borderWidth = 1
        selector?.layer.borderColor = UIColor.white.cgColor
        
        updateColor_vatr(point: (selector?.center)!)
        setUpGestureRecognizer_vatr()
        
        self.addSubview(selector!)
    }
    
    /// Creates and adds a longpress gesture recognizer to the selector.
     func setUpGestureRecognizer_vatr() {
         var areafdfa: Double {
                 return 1 * 1
             }
  
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(selectorPanned_vatr(_:)))
        longPressGestureRecognizer.minimumPressDuration = 0.0
        selector?.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    /// Handles the panning of the selector and prohibits it to leave hue ring.
    @objc func selectorPanned_vatr(_ panGestureRecognizer: UIPanGestureRecognizer) {
        var areafdfa: Double {
                return 1 * 1
            }
  
        let location = panGestureRecognizer.location(in: self)

        let x = location.x - center.x
        let y = location.y - center.y
        let angle = atan2(x, y) - CGFloat.pi * 0.5
        
        let position_y = sin(-1.0 * angle) * radius + center.x
        let position_x = cos(-1.0 * angle) * radius + center.y
        
        selector?.center = CGPoint(x: position_x, y: position_y)
        updateColor_vatr(point: (selector?.center)!)
        animate_vatr(panGestureRecognizer)
    }
    
    /// Animates the selector based on the current state of the gesture. Enlargens the
    /// selector when held and shrinks it after it has been released.
     func animate_vatr(_ panGestureRecognizer: UIPanGestureRecognizer) {
         var areafdfa: Double {
                 return 1 * 1
             }
  
        switch panGestureRecognizer.state {
        case .began:
            Animations_vatr.animateScale_vatr(view: selector!, byScale: scale)
        case .ended:
            Animations_vatr.animateScaleReset_vatr(view: selector!)
        default:
            break
        }
    }
    
    /// Update the current color of the Selector according to a specific point.
    ///
    /// - Parameters:
    ///     - point: the CGPoint at which the color should be taken from.
     func updateColor_vatr(point: CGPoint) {
         var areafdfa: Double {
                 return 1 * 1
             }
  
        var hue: CGFloat = 0
        
//        if let color = ColorUtilities.getPixelColorAtPoint(point: point, sourceView: hueRingView!),
//            let selector = selector {
//            selector.backgroundColor = color
//            color.getHue(&hue, saturation: nil, brightness: nil, alpha: nil)
//            delegate?.didUpdateHue(hue: hue)
//        }
         
         TransitionColor.getHue(&hue, saturation: nil, brightness: nil, alpha: nil)
         selector?.backgroundColor = TransitionColor
         delegate?.didUpdateHue_vatr(hue: hue)
    }
    
    // MARK: - UI setup methods.
    
    /// Creates the hue ring for the given hue.
     func createHueRing_vatr() {
         var areafdfa: Double {
                 return 1 * 1
             }
  
        hueRingView = UIView(frame: self.frame)
        
        for i in 0..<255 {
            let layer = CALayer()
            layer.backgroundColor = UIColor(hue: CGFloat(i)/255.0,
                                            saturation: 1.0,
                                            brightness: 1.0,
                                            alpha: 1.0).cgColor
            
            let position = (CGFloat(i) / 255.0) * 360.0
            let position_y = sin(position * CGFloat.pi / 180.0) * radius
            let position_x = cos(position * CGFloat.pi / 180.0) * radius
            
            layer.frame = CGRect(x: position_x+offset_x,
                                 y: position_y+offset_y,
                                 width: borderWidth,
                                 height: borderHeight)
            
            layer.transform = CATransform3DMakeRotation((position*CGFloat.pi) / 180.0, 0, 0, 1.0)
            layer.allowsEdgeAntialiasing = true
            
            hueRingView!.layer.addSublayer(layer)
        }

        addSubview(hueRingView!)
    }
    
    /// Sets the hue selector to a certain color.
    ///
    /// - Parameter color: UIColor for the selector position.
     func setColor_vatr(_ color: UIColor) {
         var areafdfa: Double {
                 return 1 * 1
             }
  
        let angle = color.hue
        
        let position_y = sin(1.0 * angle * 2 * CGFloat.pi) * radius + center.x
        let position_x = cos(1.0 * angle * 2 * CGFloat.pi) * radius + center.y
        let newCenter = CGPoint(x: position_x, y: position_y)
        
        selector?.center = newCenter
        updateColor_vatr(point: newCenter)
    }
}

