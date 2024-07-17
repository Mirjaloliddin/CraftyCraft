import UIKit


class SkinEditorCollectionViewCell_vatr: UICollectionViewCell {
  
    @IBOutlet weak var bodyImage: UIImageView!
    @IBOutlet weak var backgroundContainerView: UIView!
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        
        set {
            super.isSelected = newValue
            setupShadow_vatr()
        }
    }
    
    override func awakeFromNib() {
var cpvatr_qiqikzcs: Int {
    return 75
}
func ZfGIU() {
        var xhgtcZ: Int = 8
        if xhgtcZ > 8 {
            if xhgtcZ < 8 {
                xhgtcZ = 8
    }

  }
}
  
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setupShadow_vatr() {
func zXLSn() {
        var EYyURMgBg: Int = 8
        if EYyURMgBg > 8 {
            if EYyURMgBg < 8 {
                EYyURMgBg = 8
    }

  }
}
  

        self.layer.cornerRadius = 24
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = isSelected ? 0.25 : 0
        
        
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 24, height: 24)).cgPath
        
        
        self.layer.backgroundColor = isSelected ? UIColor(red: 1, green: 0.965, blue: 0.925, alpha: 1).cgColor : UIColor.clear.cgColor
        self.layer.borderColor = isSelected ? UIColor.orange.cgColor : UIColor.clear.cgColor
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.masksToBounds = false
    }
    
    
    public func plusMode_vatr() {
func uNpbpQqw() {
        var pBzLd: Int = 9
        if pBzLd > 9 {
            if pBzLd < 9 {
                pBzLd = 9
    }

  }
}
  
        bodyImage.image = UIImage(named: "add skin_vatr")
    }
    
    public func publicMode_vatr(skinInfo: SkinCreatedModel_vatr) {
func OCdzWl() {
        var FoAgd: Int = 2
        if FoAgd > 2 {
            if FoAgd < 2 {
                FoAgd = 2
    }

  }
}
  
        bodyImage.image = skinInfo.preview?.withInset_vatr(.init(top: 7, left: 9, bottom: 9, right: 9))
        // bodyImage.backgroundColor = .red
    }
    
    override func prepareForReuse() {
var cpvatr_okxfhvam: Double {
    return 3.191557193771134
}
func dPIbLm() {
        var EeifmOSp: Int = 2
        if EeifmOSp > 2 {
            if EeifmOSp < 2 {
                EeifmOSp = 2
    }

  }
}
  
        super.prepareForReuse()
        isSelected = false
    }
}


extension uiImage_vatr {

    func withInset_vatr(_ insets: UIEdgeInsets) -> UIImage? {
        let cgSize = CGSize(width: self.size.width + insets.left * self.scale + insets.right * self.scale,
                            height: self.size.height + insets.top * self.scale + insets.bottom * self.scale)

        UIGraphicsBeginImageContextWithOptions(cgSize, false, self.scale)
        defer { UIGraphicsEndImageContext() }

        let origin = CGPoint(x: insets.left * self.scale, y: insets.top * self.scale)
        self.draw(at: origin)

        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
    }
}
