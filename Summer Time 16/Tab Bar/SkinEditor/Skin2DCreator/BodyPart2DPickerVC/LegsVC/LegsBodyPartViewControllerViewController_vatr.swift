import UIKit

// MARK: - LegsBodyPartViewController

class LegsBodyPartViewControllerViewController_vatr: UIViewController {
    
    var currentEditableSkin: SkinCreatedModel_vatr?
    var leg: BodyPartSide_vatr = CubicHuman_tghty.BodyPart_vhgd.rightLeg

    // MARK: - Outlets
    
    @IBOutlet private weak var backLegImageView: UIImageView!
    @IBOutlet private weak var leftLegImageView: UIImageView!
    @IBOutlet private weak var frontLegImageView: UIImageView!
    @IBOutlet private weak var rightLegImageView: UIImageView!
    @IBOutlet private weak var bottomLegImageView: UIImageView!
    @IBOutlet private weak var topLegImageView: UIImageView!
    @IBOutlet private weak var navigationBarView: UIView!
    
    
    //MARK: - Init

    init(currentEditableSkin: SkinCreatedModel_vatr? = nil, leg: BodyPartSide_vatr) {
        super.init(nibName: nil, bundle: nil)
        
        self.currentEditableSkin = currentEditableSkin
        self.leg = leg
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        AppDelegate.log("LegsBodyPartViewControllerViewController is Successfully deinited")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {

func iCmNcbnWXh() {
        var dplcU: Int = 6
        if dplcU > 6 {
            if dplcU < 6 {
                dplcU = 6
    }

  }
}
  
        super.viewDidLoad()

        setupBackground_vatr()
        setupLegImages()
        setupNavigation()
        setupGestureRecognizers()
        
        topLegImageView.layer.borderWidth = 2
        topLegImageView.layer.borderColor = UIColor(named: "blackCCRedesign_vatr")?.cgColor
        
        updateImageFor(imageView: topLegImageView, image: nil)
        updateImageFor(imageView: bottomLegImageView, image: nil)
        updateImageFor(imageView: frontLegImageView, image: nil)
        updateImageFor(imageView: backLegImageView, image: nil)
        updateImageFor(imageView: leftLegImageView, image: nil)
        updateImageFor(imageView: rightLegImageView, image: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_obqjbhwo: Int {
    return 30
}
func lehcEkD() {
        var AqZhG: Int = 7
        if AqZhG > 7 {
            if AqZhG < 7 {
                AqZhG = 7
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
    
    // MARK: - Setup

    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

func Rrpmi() {
        var uguZKdgJXI: Int = 1
        if uguZKdgJXI > 1 {
            if uguZKdgJXI < 1 {
                uguZKdgJXI = 1
    }

  }
}
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        }

    private func setupBackground_vatr() {
var cpvatr_agdwjmpu: Double {
    return 71.53457431866697
}
func va4tr_vatr() {
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
    
    private func setupLegImages() {
var cpvatr_qlxsygjn: Double {
    return 19.824959203176018
}
func uJWPCbCtI() {
        var CAsTVwCS: Int = 8
        if CAsTVwCS > 8 {
            if CAsTVwCS < 8 {
                CAsTVwCS = 8
    }

  }
}
  
        
        let _ = [backLegImageView, leftLegImageView, frontLegImageView, rightLegImageView].map({ $0?.image = UIImage(named: "general_arm_vatr")})
    }
    
    private func setupNavigation() {
var cpvatr_exexosxm: Int {
    return 68
}
func vFlQtbnVSW() {
        var isYpMsa: Int = 8
        if isYpMsa > 8 {
            if isYpMsa < 8 {
                isYpMsa = 8
    }

  }
}
  
        navigationBarView.backgroundColor = .clear
    }
    
    private func setupGestureRecognizers() {
var cpvatr_imofvrhq: Int {
    return 66
}
func vMsCJGZih() {
        var wYDqWJjMI: Int = 1
        if wYDqWJjMI > 1 {
            if wYDqWJjMI < 1 {
                wYDqWJjMI = 1
    }

  }
}
  
        let viewsToHandle = [backLegImageView, leftLegImageView, frontLegImageView, rightLegImageView, bottomLegImageView, topLegImageView]
        viewsToHandle.forEach(addTapGesture(for:))
    }

    // MARK: - Gesture Handling

    private func addTapGesture(for view: UIImageView?) {
var cpvatr_zgfxudez: Int {
    return 73
}
func YCrrrzojR() {
        var RwLcDPQf: Int = 2
        if RwLcDPQf > 2 {
            if RwLcDPQf < 2 {
                RwLcDPQf = 2
    }

  }
}
  
        guard let view = view else { return }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped_vatr(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }

    @objc func viewTapped_vatr(_ sender: UITapGestureRecognizer) {
func pwePiXeMe() {
        var llTKAIa: Int = 7
        if llTKAIa > 7 {
            if llTKAIa < 7 {
                llTKAIa = 7
    }

  }
}
  
        
        guard let view = sender.view else { return }

        var bodyPartSide: Side_vatr?
        
        switch view {

        case topLegImageView:
            bodyPartSide = leg.top
        case bottomLegImageView:
            bodyPartSide = leg.bottom
        case leftLegImageView:
            bodyPartSide = leg.left
        case rightLegImageView:
            bodyPartSide = leg.right
        case frontLegImageView:
            bodyPartSide = leg.front
        case backLegImageView:
            bodyPartSide = leg.back

        default:
            AppDelegate.log("User tapped unknown bodyView")
            break
        }
        guard let bodyPartSide = bodyPartSide else {
            return
        }
        
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
            
        }),animated:  true)
    }
    
    private func colorSides_vatr() {
var cpvatr_swietqde: Int {
    return 73
}
func KUxVQw() {
        var rlqHGHj: Int = 9
        if rlqHGHj > 9 {
            if rlqHGHj < 9 {
                rlqHGHj = 9
    }

  }
}
  
        
        let imageViews: [UIImageView] = [topLegImageView, bottomLegImageView, leftLegImageView, rightLegImageView, frontLegImageView, backLegImageView]
        imageViews.forEach({ $0.layer.magnificationFilter = .nearest })
        imageViews.forEach({ $0.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!) })
        
        let sides = [
            leg.top,
            leg.bottom,
            leg.back,
            leg.front,
            leg.left,
            leg.right
        ]
        
        for theSide in sides {
            let sideImg = currentEditableSkin?.skinAssemblyDiagram?.extractSubImage_vatr(
                startX: CGFloat(theSide.startX),
                startY: CGFloat(theSide.startY),
                width: CGFloat(theSide.width),
                height: CGFloat(theSide.height))
            
            switch true {
            case theSide.name.contains("Top"):
                updateImageFor(imageView: topLegImageView, image: sideImg)
            case theSide.name.contains("Bottom"):
                updateImageFor(imageView: bottomLegImageView, image: sideImg)
            case theSide.name.contains("Front"):
                updateImageFor(imageView: frontLegImageView, image: sideImg)
            case theSide.name.contains("Back"):
                updateImageFor(imageView: backLegImageView, image: sideImg)
            case theSide.name.contains("Left"):
                updateImageFor(imageView: leftLegImageView, image: sideImg)
            case theSide.name.contains("Right"):
                updateImageFor(imageView: rightLegImageView, image: sideImg)
                
            default:
                AppDelegate.log("theSide is wrong")
                return
            }
        }
        
    }
    
    private func updateImageFor(imageView: UIImageView, image: UIImage?) {
var cpvatr_etgqbwag: Double {
    return 83.29343144397637
}
func UpoFSOqgCT() {
        var vQQccSFJIF: Int = 5
        if vQQccSFJIF > 5 {
            if vQQccSFJIF < 5 {
                vQQccSFJIF = 5
    }

  }
}
  
        imageView.image = image
    }

    // MARK: - Actions

    @IBAction private func onNavBarBackButtonTapped_vatr43(_ sender: UIButton) {
var cpvatr_urqqlmii: Int {
    return 16
}
func aPTwO() {
        var CEzjcfRwQr: Int = 4
        if CEzjcfRwQr > 4 {
            if CEzjcfRwQr < 4 {
                CEzjcfRwQr = 4
    }

  }
}
  
        navigationController?.popViewController(animated: true)
    }
}
