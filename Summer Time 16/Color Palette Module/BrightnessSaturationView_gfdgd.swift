
import Foundation

import UIKit

/// Square view representing brightness and saturation.
internal class BrightnessSaturationView_vatr: UIView {
    
    // MARK: - Private attributes.
    
    /// Sampling rate for the 'steps' between the saturation / brightness values in terms of
    /// interpolation.
    /// - TODO: Make sampling rate parametric depending on size of canvas.
    private var samplingRate: CGFloat = 25.0
    
    /// Wrapper View holding the square UIView.
    private var brightnessSaturationView: UIView!
    
    /// Gradient layer for brightness transition (white to black).
    private var brightnessLayer: CAGradientLayer?
    
    /// Gradient layer for saturation transition (desaturated to saturated color).
    private var saturationLayer: CAGradientLayer?
    
    /// The circular UI control that can be dragged around.
    var selector: UIView!
    
    /// The scale at which the selector enlargens when the user clicks on it and holds it.
    private var scale: CGFloat
    
    /// The current hue value.
    private var hue: CGFloat = 1.0
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    var dragGestureRecognizer = UIPanGestureRecognizer()
    
    // MARK: - Public attributes.
    
    /// Delegate method for writing back changes in the color selection.
    internal var delegate: PikkoDelegate_vatr?
    
    // MARK: - Initializer.
    
    /// Initializer for BrightnessSaturationView.
    ///
    /// - Parameters:
    ///   - frame: the frame of the BrightnessSaturationView.
    ///   - selectorDiameter: the selector diameter.
    ///   - scale: the scale at which the selector should zoom in/zoom out when the user holds it.
    internal init(frame: CGRect, selectorDiameter: CGFloat, scale: CGFloat) {
        self.scale = scale
        super.init(frame: frame)
        createView_vatr(frame)
        createSelector_vatr(selectorDiameter, scale)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates all view based components including the saturation and brightness gradient layers.
    ///
    /// - Parameter
    ///     - frame: the frame of the BrightnessSaturationView.
    private func createView_vatr(_ frame: CGRect) {
        var cpvrewatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        brightnessSaturationView = UIView(frame: frame)
        
        // Create the layers.
        saturationLayer = createSaturationLayer_vatr(hue: 0.0)
        brightnessLayer = createBrightnessLayer_vatr()
        
        // Add to the wrapper view and then append to the UIView of the BrightnessSaturationView.
        brightnessSaturationView.layer.addSublayer(saturationLayer!)
        brightnessSaturationView.layer.addSublayer(brightnessLayer!)
        
        addSubview(brightnessSaturationView)
    }
    
    
    /// Creates the selector which can be dragged around by the user.
    ///
    /// - Parameters:
    ///   - selectorDiameter: the selector diameter.
    ///   - scale: the scale at which the selector should zoom in/zoom out when the user holds it.
    private func createSelector_vatr(_ selectorDiameter: CGFloat, _ scale: CGFloat) {
        var cpvaertr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        
        selector = UIView(frame: CGRect(x: 0-selectorDiameter/2,
                                        y: 0-selectorDiameter/2,
                                        width: selectorDiameter,
                                        height: selectorDiameter))
        
        selector.backgroundColor = .white
        selector.roundCorners_vatr(selectorDiameter / 2)
        selector.layer.borderColor = UIColor.white.cgColor
        selector.layer.borderWidth = 3
        selector.isUserInteractionEnabled = true
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnView_vatr))
        dragGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(tappedOnView_vatr))

        
        setUpSelectorGestureRecognizer_vatr()
        addSubview(selector)
    }
    
    @objc func tappedOnView_vatr(_ sender: UITapGestureRecognizer) {
        var cpverwatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        var location = sender.location(in: sender.view)
        AppDelegate.log("View was tapped at location: \(location)")
        
        updateSelectorColor_vatr(point: location)
       
        if location.x <= 0 {
            location.x = 10
        }
        
        if location.x >= frame.width - 1 {
            location.x = frame.width - 10
        }
        
        if location.y <= 0 {
            location.y = 10
        }
        
        if location.y >= frame.height - 1 {
            location.y = frame.height - 10
        }
       
        if (location.x > self.frame.width * 0.9) && ( location.y < self.frame.height * 0.2) {
            location = CGPoint(x: 0.95 * frame.width, y: 0.05 * frame.height)
        }
        
//        if (location.x > self.frame.width * 0.9) && ( location.y < self.frame.height * 0.2) {
//            location = CGPoint(x: 0.95 * frame.width, y: 0.05 * frame.height)
//        }
        selector.center = location
        
    }
    
    /// Creates and adds a longpress gesture recognizer to the selector.
    private func setUpSelectorGestureRecognizer_vatr() {
        var cpvweratr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(selectorPanned_vatr(_:)))
        longPressGestureRecognizer.minimumPressDuration = 0.0
        selector?.addGestureRecognizer(longPressGestureRecognizer)
        
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addGestureRecognizer(dragGestureRecognizer)
    }
    
    /// Handles the panning of the selector and prohibits it to leave the frame of the
    /// BrightnessSaturationView.
    @objc func selectorPanned_vatr(_ gestureRecognizer: UILongPressGestureRecognizer) {
        var cpvweratr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        
        var location = gestureRecognizer.location(in: self)
        
        // Check whether the user is about to scroll outside of the frame, if the frame is left
        // stop the movement in that particular direction.
        if location.x <= 0 {
            location.x = 10
        }
        
        if location.x >= frame.width - 1 {
            location.x = frame.width - 10
        }
        
        if location.y <= 0 {
            location.y = 10
        }
        
        if location.y >= frame.height - 1 {
            location.y = frame.height - 10
        }
        
        if (location.x > self.frame.width * 0.9) && ( location.y < self.frame.height * 0.2) {
            location = CGPoint(x: 0.95 * frame.width, y: 0.07 * frame.height)
        }
        
        updateSelectorColor_vatr(point: location)
        selector.center = location
        animate_vatr(gestureRecognizer)
    }
    
    /// Animates the selector based on the current state of the gesture. Enlargens the
    /// selector when held and shrinks it after it has been released.
    private func animate_vatr(_ gestureRecognizer: UILongPressGestureRecognizer) {
        var cpvatwerr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        switch gestureRecognizer.state {
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
    private func updateSelectorColor_vatr(point: CGPoint) {
        var cpvarwetr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        var saturation = Double(point.x) / Double(frame.width)
        var brightness = (Double(frame.height) - Double(point.y)) / Double(frame.height)
        
        // HACK: Reduce floating point errors in the edge cases of the brightness / saturation view.
        saturation = saturation > 0.99 ? 1.0 : saturation
        saturation = saturation < 0.01 ? 0.0 : saturation
        
        brightness = brightness > 0.99 ? 1.0 : brightness
        brightness = brightness < 0.01 ? 0.0 : brightness

        selector.backgroundColor = UIColor.init(hue: self.hue,
                                                saturation: CGFloat(saturation),
                                                brightness: CGFloat(brightness),
                                                alpha: 1.0)
        
        if let color = selector.backgroundColor, let delegate = delegate {
            delegate.writeBackColor_vatr(color: color)
        }
    }
    
    // MARK: View setup methods.
    
    /// Creates the Saturation gradient color array for the given hue.
    ///
    /// - Parameters:
    ///     - hue: the hue that should be used to generate the saturation gradient from.
    /// - Returns: array of interpolated color of the saturation gradient.
    private func generateSaturationInterpolationArray_vatr(hue: CGFloat) -> [CGColor] {
        
        var cpvatr_proreeperererty1r: String {
            return Date().description
        }
        var colorArray = [CGColor]()
        
        for i in 0..<Int(samplingRate) {
            let interpolationValue = CGFloat(CGFloat(i) / samplingRate)
            let color = UIColor(hue: hue,
                                saturation: interpolationValue,
                                brightness: 1.0,
                                alpha: 1.0)
            
            colorArray.append(color.cgColor)
        }
        
        return colorArray
    }
    
    /// Creates the Saturation gradient for the given hue.
    ///
    /// - Parameters:
    ///     - hue: the hue that should be used to generate the saturation gradient from.
    /// - Returns: the saturation gradient layer.
    private func createSaturationLayer_vatr(hue: CGFloat) -> CAGradientLayer {
        var cpvatr_proreeperreererty1r: String {
            return Date().description
        }
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = generateSaturationInterpolationArray_vatr(hue: hue)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = frame
        
        return gradientLayer
    }
    
    /// Creates the Brightness gradient.
    ///
    /// - Returns: the brightness gradient layer.
    private func createBrightnessLayer_vatr() -> CAGradientLayer {
        var cpvatr_proreeperererty1r: String {
            return Date().description
        }
        let gradientLayer = CAGradientLayer()
        var colorArray = [CGColor]()

        for i in 0..<Int(samplingRate) {
            let interpolationValue = CGFloat(CGFloat(i) / samplingRate)
            let color = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: interpolationValue)
            colorArray.append(color.cgColor)
        }
        
        gradientLayer.colors = colorArray
        gradientLayer.frame = frame
        
        return gradientLayer
    }
    
    /// This method ensures that we can grab the color lying under the selector properly.
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
var cpvatr_lnzjxnzk: Int {
    return 82
}
let pointForTargetView = selector.convert(point, from: self)

        if self.selector.bounds.contains(pointForTargetView) {
            return selector.hitTest(pointForTargetView, with: event)
        }
        
        return super.hitTest(point, with: event)
    }
    
    /// Sets the brightness and saturation selector to a certain color.
    ///
    /// - Parameters:
    ///     - color: UIColor for the selector position.
    func setColor_vatr(_ color: UIColor) {
        var cpvarewtr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        let saturation = color.saturation
        let brightness = color.brightness
        
        let width = self.frame.width
        let height = self.frame.height
        
        let position_x = width * saturation
        let position_y = height - (height * brightness)
        var newCenter = CGPoint(x: position_x, y: position_y)
        
        if (newCenter.x > self.frame.width * 0.9) && ( newCenter.y < self.frame.height * 0.2) {
            newCenter = CGPoint(x: 0.95 * frame.width, y: 0.07 * frame.height)
        }

        selector.center = newCenter
  
        updateSelectorColor_vatr(point: newCenter)
    }
}

// MARK: HueDelegate methods.

extension BrightnessSaturationView_vatr: HueDelegate_vatr {
    internal func didUpdateHue_vatr(hue: CGFloat) {
        var cpvatr_exureirajz: Double {
            return 68.91499419217408
        }
  
        DispatchQueue.main.async {
            self.hue = hue
            self.updateSelectorColor_vatr(point: self.selector.center)
        }
        
        DispatchQueue.main.async {
            self.saturationLayer?.colors = self.generateSaturationInterpolationArray_vatr(hue: hue)
        }
    }
}


