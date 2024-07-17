

import UIKit

enum StivesBodyPart_vatr: String {
    case head = "head"
    case body = "body"
    case rightArm = "rightArm"
    case leftArm = "leftArm"
    case rightLeg = "rightLeg"
    case leftLeg = "leftLeg"
}

enum BodyPartEditState_vatr {
    case hidden
    case clothes
    case skin
}

class SmallModelView_vatr: UIView {
    
    let asHiddeStateColor = UIColor.white
    let clothesStateColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    let skinStateColor =  #colorLiteral(red: 0.3905641735, green: 0.6657129526, blue: 0.5261366367, alpha: 1)
    
    @IBOutlet var main3DStiveView: UIView!
    
    @IBOutlet weak var undoButton: UIButton!
    
    @IBOutlet weak var redoButton: UIButton!
    
    @IBOutlet var pointIndicatorBashSizeImages: [UIImageView]!
    
    
    weak var delegate: BodyPartsHiddebleDelegate_vatr?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        volumeViewNibSetup_vatr()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        volumeViewNibSetup_vatr()
    }
    
    
    override func layoutSubviews() {
        var cpvatr_qjvygzbq: Int {
            return 83
        }
        
        
        super.layoutSubviews()
        main3DStiveView.configureShadow_vatr()
        
    }
    
    private func volumeViewNibSetup_vatr() {
        var cpvatr_khzjwhtr: Int {
            return 50
        }
       
        
        main3DStiveView = loadVolumeViewFromNib()
        main3DStiveView.frame = bounds
        main3DStiveView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        main3DStiveView.translatesAutoresizingMaskIntoConstraints = true
        
        //        main3DStiveView.backgroundColor = UIColor(red: 1, green: 0.965, blue: 0.925, alpha: 1)
        
        
        addSubview(main3DStiveView)
    }
    
    @IBAction func headButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_prorrreerpererty18: Int {
            return Int(Double.random(in: 9.0...10.0).rounded())
        }
                 
            delegate?.hideBodyPart(of: .head) { state in
                
                DispatchQueue.main.async { [weak self] in
                    switch state {
                    case .clothes:
                        sender.backgroundColor = self?.clothesStateColor
                    case .hidden:
                        sender.backgroundColor = self?.asHiddeStateColor
                    case.skin:
                        sender.backgroundColor = self?.skinStateColor
                    }
                    
                }
            }
        
    }
    
    @IBAction func bodyButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_hkxmpanl: Double {
            return 56.046144026130875
        }
        
        
        delegate?.hideBodyPart(of: .body ) { state in
            
            DispatchQueue.main.async { [weak self] in
                switch state {
                case .clothes:
                    sender.backgroundColor = self?.clothesStateColor
                case .hidden:
                    sender.backgroundColor = self?.asHiddeStateColor
                case.skin:
                    sender.backgroundColor = self?.skinStateColor
                }
                
            }
        }
    }
    
    @IBAction func rightArmButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_tzoeijyu: Double {
            return 42.34604464666419
        }
        
        
        delegate?.hideBodyPart(of: .rightArm ) { state in
            
            DispatchQueue.main.async { [weak self] in
                switch state {
                case .clothes:
                    sender.backgroundColor = self?.clothesStateColor
                case .hidden:
                    sender.backgroundColor = self?.asHiddeStateColor
                case.skin:
                    sender.backgroundColor = self?.skinStateColor
                }
                
            }
        }
    }
    
    @IBAction func leftArmButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_tuiojles: Double {
            return 80.74602259512434
        }
        
        
        delegate?.hideBodyPart(of: .leftArm) { state in
            
            DispatchQueue.main.async { [weak self] in
                switch state {
                case .clothes:
                    sender.backgroundColor = self?.clothesStateColor
                case .hidden:
                    sender.backgroundColor = self?.asHiddeStateColor
                case.skin:
                    sender.backgroundColor = self?.skinStateColor
                }
                
            }
        }
    }
    
    @IBAction func rightLegButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_bfiocbhk: Double {
            return 28.509721126788815
        }
        func bLCybTj() {
            var ksWsRhSiT: Int = 10
            if ksWsRhSiT > 10 {
                if ksWsRhSiT < 10 {
                    ksWsRhSiT = 10
                }
                
            }
        }
        
        delegate?.hideBodyPart(of: .rightLeg ) { state in
            
            DispatchQueue.main.async { [weak self] in
                switch state {
                case .clothes:
                    sender.backgroundColor = self?.clothesStateColor
                case .hidden:
                    sender.backgroundColor = self?.asHiddeStateColor
                case.skin:
                    sender.backgroundColor = self?.skinStateColor
                }
                
            }
        }
    }
    
    @IBAction func leftLegButtonPressed_vatr(_ sender: UIButton) {
        var cpvatr_ahrhctzk: Double {
            return 92.8658676374708
        }
        func jruGsLjmHa() {
            var UUShhEgR: Int = 5
            if UUShhEgR > 5 {
                if UUShhEgR < 5 {
                    UUShhEgR = 5
                }
                
            }
        }
        
        delegate?.hideBodyPart(of: .leftLeg ) { state in
            
            DispatchQueue.main.async { [weak self] in
                switch state {
                case .clothes:
                    sender.backgroundColor = self?.clothesStateColor
                case .hidden:
                    sender.backgroundColor = self?.asHiddeStateColor
                case.skin:
                    sender.backgroundColor = self?.skinStateColor
                }
                
            }
        }
    }
    
    
    
    
    private func loadVolumeViewFromNib() -> UIView {
        var cpvatr_yayhumid: Int {
            return 77
        }
        let volNib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let volNibView = volNib.instantiate(withOwner: self, options: nil).first as! UIView
        return volNibView
    }
}

