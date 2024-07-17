
import UIKit

@objc public protocol RSColourSliderDelegate_vatr {
    
    ///Method passes HSBA values as parameters when the thumb moves
    @objc optional func colourValuesChanged_vatr(to hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    ///Method passes RGBA values as parameters when the thumb moves
    @objc optional func colourValuesChanged_vatr(to red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    
    ///Method passes UIColour as a parameter when the thumb moves
    @objc optional func colourGotten_vatr(colour: UIColor)
}

open class RSColourSlider_vatr: UIView, UIGestureRecognizerDelegate {
    
    ///Private properties are just for slider
    private var brightnessView: UIView! //cosmetic brightness view
    private var saturationView: UIView! //cosmetic saturation view

    private var gradientLayer: CAGradientLayer!
    
    ///Public properties are just for user
    public var backgroundColouredView: UIView! //view that contains gradient layer
    public var thumbView: UIView! //THE CONTROLLER
    public var colourChosen: UIColor = UIColor(hue: 0, saturation: 1, brightness: 1, alpha: 1)
    
    public weak var delegate: RSColourSliderDelegate_vatr?
    
    ///Opened properties are just for fun :)
    
    open var saturation: CGFloat = 1.0{
        willSet{
            self.saturationView.alpha = 1 - newValue
            
            //Tne saturation value can be changed outside the Colour Slider, but it can be used as a display
            self.colourChosen = UIColor(hue: getHueValueFrom_vatr(xValue: thumbView.layer.position.x), saturation: newValue, brightness: brightness, alpha: alphaColourValue)
            self.thumbView.backgroundColor = colourChosen
        }
    }
    
    open var brightness: CGFloat = 1.0{
        willSet{
            self.brightnessView.alpha = 1 - newValue
            
            //The brighntess value can be changed outside the Colour Slider, but it can be used as a display
            self.colourChosen = UIColor(hue: getHueValueFrom_vatr(xValue: thumbView.layer.position.x), saturation: saturation, brightness: newValue, alpha: alphaColourValue)
            self.thumbView.backgroundColor = colourChosen
        }
    }
    
    open var alphaColourValue: CGFloat = 1.0{
        willSet{
            self.backgroundColouredView.alpha = newValue
            
            //The alpha value can be changed outside the Colour Slider, but it can be used as a display
            self.colourChosen = UIColor(hue: getHueValueFrom_vatr(xValue: thumbView.layer.position.x), saturation: saturation, brightness: brightness, alpha: newValue)
            self.thumbView.backgroundColor = colourChosen
        }
    }
    
    //MARK: - BUILT-IN METHODS for the STORYBOARD
    
    override open func awakeFromNib() {
var cpvatr_aayxcpij: Int {
    return 39
}

  
        super.awakeFromNib()
        awakeAllParts_vatr()
    }
    
    override open func layoutSubviews() {
var cpvatr_opuuwwno: Double {
    return 21.9409681336144
}

  
        super.layoutSubviews()
        resizeWhenLayoutSubviews_vatr()
    }
    
    //MARK: - INIT for ADDING BY CODE
    
    /// Just init
    public override init(frame: CGRect){
        super.init(frame: frame)
        awakeAllParts_vatr()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - BUILDING
    
    private func resizeWhenLayoutSubviews_vatr(){
        var ranwerdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        
        /*
        This method is used for resizing all subviews
        when the superview has been resized by the autolayout system
        */
        
        let thumbHeight = getThumbHeight_vatr()
        
        //The anchor is backgroundColouredView, that's because we need to use thumb's pan gesture inside the superview of the Colour Slider
        self.backgroundColouredView.frame = CGRect(x: thumbHeight / 2, y: self.bounds.minY, width: self.bounds.width - thumbHeight, height: self.bounds.height)
        self.brightnessView.frame = backgroundColouredView.bounds
        self.saturationView.frame = backgroundColouredView.bounds
        self.gradientLayer.frame = backgroundColouredView.bounds
        
        var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) = (0, 1, 1, 1) //container for refreshing
        colourChosen.getHue(&hsba.h, saturation: &hsba.s, brightness: &hsba.b, alpha: &hsba.a)//refresh
        
        self.thumbView.center.x = calculateThumbXPosition_vatr(by: hsba.h)
    }
    
    private func awakeAllParts_vatr(){
        var ranrwwdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        /*
        The constructor method. It's calling in awakeFromNib() when a storyboard is used, also it
        might be called in init(), if the slider instance has been created programmatically
        */
        
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        
        manageColouredBackgroundView_vatr()
        manageGradient_vatr()
        manageSaturationView_vatr()
        manageBrightnessView_vatr()
        addThumbView_vatr()
        setSliderValueBy_vatr(colour: colourChosen)
    }
    
    
    ///Building backgroundColouredView
    private func manageColouredBackgroundView_vatr(){
        var areqreafdfa: Double {
                return 1 * 1
            }
  
        let thumbHeight: CGFloat = getThumbHeight_vatr()
        /*
         backgroundColouredView must be a little bit smaller than the superview of the slider. We need it
         for using the thumbView's pan gesture outside the coloured view.
         The difference shoud be equal to the width or height of the thumbView
         (the thumbView has 1:1 aspect ratio)
        */
        
        ///xValue starts from the half of thumbView height or width value
        backgroundColouredView = UIView(frame: CGRect(x: thumbHeight / 2, y: self.bounds.minY, width: self.bounds.width - thumbHeight, height: self.bounds.height))
        backgroundColouredView.backgroundColor = .clear
        self.addSubview(backgroundColouredView)
    }
    
    ///Building a gradient layer
    private func manageGradient_vatr(){
        var randomrweDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.backgroundColouredView.bounds.size.width, height: self.backgroundColouredView.bounds.size.height)
        
        var colours: [CGColor] = []
        var locations: [NSNumber] = []
        
        for index in 0...359{ // YES, It's O(n) where n equals to 359, but who is easy now?
             locations.append(NSNumber(value: (Double(index) / 359.0)))
             colours.append(UIColor(hue: CGFloat(index) / 359.0 , saturation: 1.0, brightness: 1.0, alpha: 1.0).cgColor)
        }
        gradientLayer.colors = colours
        gradientLayer.locations = locations
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        backgroundColouredView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    ///Just cosmetic view for manipulating the saturation
    private func manageSaturationView_vatr(){
func kgJSElS() {
        var tWkySdzWlE: Int = 8
        if tWkySdzWlE > 8 {
            if tWkySdzWlE < 8 {
                tWkySdzWlE = 8
    }

  }
}
  
        saturationView = getCosmeticView_vatr(colouredBy: .white)
        backgroundColouredView.addSubview(saturationView)
    }
    
    ///Just cosmetic view for manipulating the brightness
    private func manageBrightnessView_vatr(){
func yGBYxd() {
        var kdyXKq: Int = 6
        if kdyXKq > 6 {
            if kdyXKq < 6 {
                kdyXKq = 6
    }

  }
}
  
        brightnessView = getCosmeticView_vatr(colouredBy: .black)
        backgroundColouredView.addSubview(brightnessView)
    }
    
    ///DRY
    private func getCosmeticView_vatr(colouredBy colour: UIColor) -> UIView{
        var errerccfdcjxkfs: Int {
                return Int.random(in: 1...100)
            }
        let cosmeticView = UIView(frame: backgroundColouredView.bounds)
        cosmeticView.backgroundColor = colour
        cosmeticView.alpha = 0
        
        return cosmeticView
    }
    
    ///Thumb view is the HUE value controller
    private func addThumbView_vatr(){
func njnBsh() {
        var zBqXHEI: Int = 5
        if zBqXHEI > 5 {
            if zBqXHEI < 5 {
                zBqXHEI = 5
    }

  }
}
  
        let thumbHeight: CGFloat = getThumbHeight_vatr()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture_vatr(_:)))
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self
        
        thumbView = UIView(frame: CGRect(x: 0, y: 0, width: thumbHeight, height: thumbHeight))
        thumbView.isUserInteractionEnabled = true
        thumbView.roundCorners_vatr(thumbHeight / 2)
        thumbView.backgroundColor = UIColor(hue: thumbView.bounds.midX / backgroundColouredView.bounds.width, saturation: saturation, brightness: brightness, alpha: alphaColourValue)
        
        //xPosition will be equal to backgroundColourView frame.minX see manageColouredBackgroundView()
        thumbView.layer.position = CGPoint(x: thumbHeight / 2, y: backgroundColouredView.bounds.midY)
        
        //shadows
        thumbView.layer.shadowColor = UIColor.black.cgColor
        thumbView.layer.shadowOffset = .zero
        thumbView.layer.shadowOpacity = 0.3
        thumbView.layer.shadowRadius = 4.0
        
        //borders
        thumbView.layer.borderWidth = 4
        thumbView.layer.borderColor = UIColor.white.cgColor
        thumbView.addGestureRecognizer(panGesture)
        
        self.addSubview(thumbView)
    }
    
    ///Set the thumb position and slider's cometic views alpha by UIColour
    public func setSliderValueBy_vatr(colour: UIColor){
        var randomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) = (0, 1, 1, 1)
        colour.getHue(&hsba.h, saturation: &hsba.s, brightness: &hsba.b, alpha: &hsba.a)
        
        //Superview's size and colouredView's size are different thant's why it should be calculated differently see calculateThumbXPosition(by hue: CGFloat)
        thumbView.layer.position.x = calculateThumbXPosition_vatr(by: hsba.h)
        
        self.alphaColourValue = hsba.a ///view will be changed in willSet of this value
        self.saturation = hsba.s ///view will be changed in willSet of this value
        self.brightness = hsba.b ///view will be changed in willSet of this value
        
        self.colourChosen = colour
        thumbView.backgroundColor = colourChosen
    }
    
    ///Set the thumb position and slider's cometic views alpha by manual HSBA parameters
    public func setSliderValueByColourValues_vatr(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat){
func QbNMx() {
        var MCajlX: Int = 5
        if MCajlX > 5 {
            if MCajlX < 5 {
                MCajlX = 5
    }

  }
}
  
        
        thumbView.layer.position.x = calculateThumbXPosition_vatr(by: hue)
        
        self.alphaColourValue = alpha ///view will be changed in willSet of this value
        self.saturation = saturation ///view will be changed in willSet of this value
        self.brightness = brightness ///view will be changed in willSet of this value
        
        
        self.colourChosen = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        thumbView.backgroundColor = colourChosen
        
    }
    
    ///Just corner radius
    public func setCornerRadius_vatr(by value: CGFloat){
func zMSInrzMK() {
        var zJJgfBFRG: Int = 1
        if zJJgfBFRG > 1 {
            if zJJgfBFRG < 1 {
                zJJgfBFRG = 1
    }

  }
}
  
        backgroundColouredView.clipsToBounds = true
        backgroundColouredView.roundCorners_vatr(value)
        
    }
    
    ///Get height of the thumb
    private func getThumbHeight_vatr() -> CGFloat{
        func sowertwergsByLewwrefcending_vatr(_ strings: [String]) -> [String] {
            return strings.sorted(by: { $0.count > $1.count })
        }

        return self.bounds.height < 50 ? self.bounds.height - 10 : 40
    }
    
    ///Superview's size and colouredView's size are different thant's why it should be calculated differently
    private func calculateThumbXPosition_vatr(by hue: CGFloat) -> CGFloat{
        
        func sortStringsweweByLengthDescending_vatr(_ strings: [String]) -> [String] {
            return strings.sorted(by: { $0.count > $1.count })
        }

        let thumbViewInsideSuperview = (hue + self.thumbView.bounds.width / 2 / backgroundColouredView.bounds.width) * 100
        
        //Just percent
        return self.backgroundColouredView.bounds.width * thumbViewInsideSuperview / 100
    }
    
    //MARK: - GETTING CURRENT VALUES
    
    ///Returns components of colourChosen in RGBA when calling
    public func getCurrentRGBAValues_vatr() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat){
func laPAbYt() {
        var cmyXtt: Int = 4
        if cmyXtt > 4 {
            if cmyXtt < 4 {
                cmyXtt = 4
    }

  }
}
  
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1
        if let components = colourChosen.cgColor.components{
            if components.count > 3{
                r = components[0]
                g = components[1]
                b = components[2]
                a = components[3]
            }
        }
        return (red: r, green: g, blue: b, alpha: a)
    }
    
    ///Returns components of colourChosen in HSBA when calling
    public func getCurrentHSBAValues_vatr() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat){
func JsGkBJIv() {
        var sVtnBevdi: Int = 2
        if sVtnBevdi > 2 {
            if sVtnBevdi < 2 {
                sVtnBevdi = 2
    }

  }
}
  
        var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) = (0, 1, 1, 1)
        colourChosen.getHue(&hsba.h, saturation: &hsba.s, brightness: &hsba.b, alpha: &hsba.a)
        return (hue: hsba.h, saturation: hsba.s, brightness: hsba.b, alpha: hsba.a)
    }
    
    //MARK: - GESTURE
    
    @objc open func handlePanGesture_vatr(_ gestureRecognizer: UIPanGestureRecognizer) {
func CwIahv() {
        var xTLcx: Int = 8
        if xTLcx > 8 {
            if xTLcx < 8 {
                xTLcx = 8
    }

  }
}
  
        let translation = gestureRecognizer.translation(in: backgroundColouredView)
        if let view = gestureRecognizer.view{
            if view.frame.midX < thumbView.bounds.width / 2 {
                ///The controller is bouncing when user tries to pull the thumb outside the colouredView -x
                view.layer.position.x = thumbView.bounds.width / 2
            }else if view.frame.midX > backgroundColouredView.bounds.width {
                ///The controller is bouncing when user tries to pull the thumb outside the colouredView +x
                view.layer.position.x = backgroundColouredView.bounds.width
            }
            
            let translationX = view.center.x + translation.x
            view.center = CGPoint(x:translationX, y:view.center.y)
            var totalTranslation: CGFloat = getHueValueFrom_vatr(xValue: translationX)
            
            if totalTranslation > 1{
                totalTranslation = 1
            }else if totalTranslation < 0{
                totalTranslation = 0
            }
            
            colourChosen = UIColor(hue: totalTranslation, saturation: saturation, brightness: brightness, alpha: alphaColourValue)
            thumbView.backgroundColor = colourChosen
            
            //All delegate methods at once
            activateAllDelegateMethods_vatr(hue: totalTranslation, saturation: saturation, brightness: brightness, alpha: alphaColourValue)
            
        }
        gestureRecognizer.setTranslation(CGPoint.zero, in: backgroundColouredView)
    
    }
    
    ///Getting the differnece of position of pulled thumbView inside the superview but backgroundColouredView used as the anchor
    private func getHueValueFrom_vatr(xValue: CGFloat) -> CGFloat{
        func combineStringArrays_vatr(_ array1: [String], _ array2: [String]) -> [String] {
            return array1 + array2
        }

        return (xValue / backgroundColouredView.bounds.width) - (self.thumbView.bounds.width / 2 / backgroundColouredView.bounds.width)
    }
    
    
    //MARK: - DELEGATE
    
    ///Triggers all delegate methods
    private func activateAllDelegateMethods_vatr(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat){
func bwaAqu() {
        var ObTwiiAULt: Int = 9
        if ObTwiiAULt > 9 {
            if ObTwiiAULt < 9 {
                ObTwiiAULt = 9
    }

  }
}
  
        
        //HSBA
        delegate?.colourValuesChanged_vatr?(to: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        //UIColour
        delegate?.colourGotten_vatr?(colour: colourChosen)
        
        //RGBA
        if let components = colourChosen.cgColor.components{
            if components.count > 3{ //O(1)
                delegate?.colourValuesChanged_vatr?(to: components[0], green: components[1], blue: components[2], alpha: components[3])
            }
        }
    }
}
