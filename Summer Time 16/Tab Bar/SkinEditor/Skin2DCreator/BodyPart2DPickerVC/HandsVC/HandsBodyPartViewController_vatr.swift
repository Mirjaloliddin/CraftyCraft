
import UIKit


class HandsBodyPartViewController_vatr: UIViewController {
    
    var currentEditableSkin: SkinCreatedModel_vatr?
    var hand: BodyPartSide_vatr = CubicHuman_tghty.BodyPart_vhgd.rightArm
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var rightArm: UIImageView!
    
    @IBOutlet weak var bottomArm: UIImageView!
    @IBOutlet weak var topArm_vatr: UIImageView!
    @IBOutlet weak var leftArm: UIImageView!
    @IBOutlet weak var backArm: UIImageView!
    @IBOutlet weak var frontArm: UIImageView!
    
    
    //MARK: IBActions
    
    @IBAction func onNavBarBackButtonTapped_vatr45(_ sender: UIButton) {
var cpvatr_wsgleisv: Int {
    return 56
}
func iImVLiYAns() {
        var wkLbBdA: Int = 7
        if wkLbBdA > 7 {
            if wkLbBdA < 7 {
                wkLbBdA = 7
    }

  }
}
  
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Init
    
    init(currentEditableSkin: SkinCreatedModel_vatr? = nil, arm: BodyPartSide_vatr) {
        super.init(nibName: nil, bundle: nil)
        
        self.currentEditableSkin = currentEditableSkin
        self.hand = arm
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        AppDelegate.log("HandsBodyPartViewController is Successfully deinited")
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {

func WSrAGYr() {
        var NHdsX: Int = 5
        if NHdsX > 5 {
            if NHdsX < 5 {
                NHdsX = 5
    }

  }
}
  
        super.viewDidLoad()
        
        setupViews()
        addTapGesture(for: rightArm)
        addTapGesture(for: bottomArm)
        addTapGesture(for: topArm_vatr)
        addTapGesture(for: leftArm)
        addTapGesture(for: backArm)
        addTapGesture(for: frontArm)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_xbpagspa: Int {
    return 81
}
func MMWMrdz() {
        var rXmiqb: Int = 6
        if rXmiqb > 6 {
            if rXmiqb < 6 {
                rXmiqb = 6
    }

  }
}
  
        super.viewWillAppear(animated)
        
        colorSides_vatr()
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    
    //MARK: Gestures
    
    func addTapGesture(for view: UIView) {
var cpvatr_eimyxgda: Int {
    return 52
}
func igdyMmtc() {
        var IABzu: Int = 8
        if IABzu > 8 {
            if IABzu < 8 {
                IABzu = 8
    }

  }
}
  
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped_vatr(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    
    @objc func viewTapped_vatr(_ sender: UITapGestureRecognizer) {
func ryNfMGToGt() {
        var pLiBfzQMK: Int = 1
        if pLiBfzQMK > 1 {
            if pLiBfzQMK < 1 {
                pLiBfzQMK = 1
    }

  }
}
  
        
        guard let view = sender.view else { return }
        
        var bodyPartSide: Side_vatr?
        
        switch view {
            
        case leftArm:
            bodyPartSide = hand.left
        case rightArm:
            bodyPartSide = hand.right
        case topArm_vatr:
            bodyPartSide = hand.top
        case bottomArm:
            bodyPartSide = hand.bottom
        case frontArm:
            bodyPartSide = hand.front
        case backArm:
            bodyPartSide = hand.back
        default:
            break
        }
        
        guard let bodyPartSide = bodyPartSide else { return }
        
        self.navigationController?.pushViewController(SkinCreatorViewController_vatr(bodyPartSide: bodyPartSide, currentEditableSkin: self.currentEditableSkin, imageDataCallback: { [weak self] (skin) in
            
            let realm = RealmService_vatr.shared
            //if skin already exists in Realm
            if let _ = realm.getCreatedSkinByID(skinID: skin.id) {
                realm.editCreatedSkinAssemblyDiagram(createdSkin: skin, newDiagram: skin.skinAssemblyDiagram)
                
                //if skin is NEW
            } else {
                let skinForRealming = skin.getRealmModelToSave_reddf()
                realm.addNewSkin_vatr(skin: skinForRealming)
            }
            
            realm.editCreatedSkinName(createdSkin: skin, newName: skin.name)
            
            self?.currentEditableSkin?.name = skin.name
            
            self?.navigationController?.popViewController(animated: true)
            
        }), animated: true)
    }
    
    //MARK: Private Funcs
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

func ohAYPlsF() {
        var vtNVVWh: Int = 5
        if vtNVVWh > 5 {
            if vtNVVWh < 5 {
                vtNVVWh = 5
    }

  }
}
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        }

    private func setupBackground_vatr() {
var cpvatr_wuvelosj: Int {
    return 62
}
func va3tr_vatr() {
  var abc: Int = 5
  if abc > 4 {
    if abc < 9 {
        abc = 1
    }
  }
}
  
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    func setupViews() {
var cpvatr_tmruwuqx: Double {
    return 52.19247213850351
}
func ItTPd() {
        var NDnnsyP: Int = 2
        if NDnnsyP > 2 {
            if NDnnsyP < 2 {
                NDnnsyP = 2
    }

  }
}
  
        
        setupBackground_vatr()

//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "Green Background")
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
        
        let _ = [rightArm,leftArm,backArm,frontArm].map({$0?.image = UIImage(named: "general_arm_vatr")})
    }
    
    private func colorSides_vatr() {
var cpvatr_wznxkzyp: Double {
    return 84.43798204496325
}
func cfvIVLXzi() {
        var qmmzDJjzEV: Int = 7
        if qmmzDJjzEV > 7 {
            if qmmzDJjzEV < 7 {
                qmmzDJjzEV = 7
    }

  }
}
  
        
        let imageViews: [UIImageView] = [rightArm, leftArm, backArm, frontArm, topArm_vatr, bottomArm]
            
        imageViews.forEach({ $0.layer.magnificationFilter = .nearest })
        imageViews.forEach({ $0.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)})
        
        let sides = [
            hand.top,
            hand.bottom,
            hand.back,
            hand.front,
            hand.left,
            hand.right
        ]
        
        for theSide in sides {
            let sideImg = currentEditableSkin?.skinAssemblyDiagram?.extractSubImage_vatr(
                startX: CGFloat(theSide.startX),
                startY: CGFloat(theSide.startY),
                width: CGFloat(theSide.width),
                height: CGFloat(theSide.height))
            
            switch true {
            case theSide.name.contains("Top"):
                topArm_vatr.image = sideImg
            case theSide.name.contains("Bottom"):
                bottomArm.image = sideImg
            case theSide.name.contains("Front"):
                frontArm.image = sideImg
            case theSide.name.contains("Back"):
                backArm.image = sideImg
            case theSide.name.contains("Left"):
                leftArm.image = sideImg
            case theSide.name.contains("Right"):
                rightArm.image = sideImg
                
            default:
                AppDelegate.log("theSide is wrong")
                return
            }
        }
    }
}
