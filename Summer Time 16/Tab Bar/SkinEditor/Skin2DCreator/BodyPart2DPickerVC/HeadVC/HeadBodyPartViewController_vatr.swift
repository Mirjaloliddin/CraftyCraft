import UIKit


class HeadBodyPartViewController_vatr: UIViewController {

    var currentEditableSkin: SkinCreatedModel_vatr?
    var bodyPartSide = CubicHuman_tghty.BodyPart_vhgd.head

    // MARK: - Outlets

    @IBOutlet private weak var backHeadImageView: UIImageView!
    @IBOutlet private weak var rightHeadImageView: UIImageView!
    @IBOutlet private weak var leftHeadImageView: UIImageView!
    @IBOutlet private weak var frontHeadImageView: UIImageView!
    @IBOutlet private weak var bottomHeadImageView: UIImageView!
    @IBOutlet private weak var topHeadImageView: UIImageView!
    @IBOutlet private weak var navigationBarView: UIView!

    @IBOutlet weak var backV: UIView!
    
    // MARK: - Actions

    @IBAction private func onNavBarBackButtonTapped_vatr23(_ sender: UIButton) {
var cpvatr_jyuejwap: Int {
    return 22
}
func rSipx() {
        var WCfofpUPj: Int = 5
        if WCfofpUPj > 5 {
            if WCfofpUPj < 5 {
                WCfofpUPj = 5
    }

  }
}
  
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Init
    
    init(currentEditableSkin: SkinCreatedModel_vatr? = nil, layerToEdit: CurrentEditableLayer_gdfg) {
        super.init(nibName: nil, bundle: nil)
        
        self.currentEditableSkin = currentEditableSkin
        if layerToEdit == .innerLayer {
            bodyPartSide = CubicHuman_tghty.BodyPart_vhgd.head
        } else {
            bodyPartSide = CubicHuman_tghty.BodyPart_vhgd.head1
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        AppDelegate.log("HeadBodyPartViewController is Successfully deinited")
    }


    // MARK: - LifeCycle

    override func viewDidLoad() {

func FiaJZzFo() {
        var lzelMI: Int = 6
        if lzelMI > 6 {
            if lzelMI < 6 {
                lzelMI = 6
    }

  }
}
  
        super.viewDidLoad()

        setupBackground_vatr()
        setupHeadImages_vatr()
        setupNavigation_vatr()
        setupGestureRecognizers_vatr()
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_ncdfepyb: Double {
    return 12.33617036887491
}
func VsPCO() {
        var qKQSAk: Int = 5
        if qKQSAk > 5 {
            if qKQSAk < 5 {
                qKQSAk = 5
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

func JVcpsHGwy() {
        var uvOqvNck: Int = 3
        if uvOqvNck > 3 {
            if uvOqvNck < 3 {
                uvOqvNck = 3
    }

  }
}
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        
        }

    private func setupBackground_vatr() {
var cpvatr_ikysuiry: Double {
    return 1.1858217758537004
}
func vartr34_vatr() {
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
    
    private func setupHeadImages_vatr() {
func unLEt() {
        var ELNmGCPRdE: Int = 9
        if ELNmGCPRdE > 9 {
            if ELNmGCPRdE < 9 {
                ELNmGCPRdE = 9
    }

  }
}
  
        let headImageViews: [UIImageView] = [backHeadImageView, rightHeadImageView, leftHeadImageView, frontHeadImageView, bottomHeadImageView, topHeadImageView]
        headImageViews.forEach { $0.image = UIImage(named: "general_head_vatr") }
        headImageViews.forEach{ $0.layer.magnificationFilter = .nearest }
        headImageViews.forEach{ $0.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!) }
    }
    
    private func setupNavigation_vatr() {
func MOiAgG() {
        var BawlxYSPo: Int = 10
        if BawlxYSPo > 10 {
            if BawlxYSPo < 10 {
                BawlxYSPo = 10
    }

  }
}
  
        navigationBarView.backgroundColor = .clear
    }
    
    private func setupGestureRecognizers_vatr() {
func IXUUCPAgI() {
        var dzVPB: Int = 6
        if dzVPB > 6 {
            if dzVPB < 6 {
                dzVPB = 6
    }

  }
}
  
        let viewsToHandle = [backHeadImageView, rightHeadImageView, leftHeadImageView, frontHeadImageView, bottomHeadImageView, topHeadImageView]
        viewsToHandle.forEach(addTapGesture_vatr(for:))
    }
    
    private func colorSides_vatr() {
func tlCTY() {
        var puHBAOoYQ: Int = 9
        if puHBAOoYQ > 9 {
            if puHBAOoYQ < 9 {
                puHBAOoYQ = 9
    }

  }
}
  
        let sidesArr = [
            bodyPartSide.top,
            bodyPartSide.bottom,
            bodyPartSide.back,
            bodyPartSide.front,
            bodyPartSide.left,
            bodyPartSide.right
        ]

        var img: UIImage?

        for theSide in sidesArr {

        img = currentEditableSkin?.skinAssemblyDiagram
            
            let sideImg = img?.extractSubImage_vatr(
                startX: CGFloat(theSide.startX),
                startY: CGFloat(theSide.startY),
                width: CGFloat(theSide.width),
                height: CGFloat(theSide.height))
            
            
            switch true {
            case theSide.name.contains("Top"):
                topHeadImageView.image = sideImg
            case theSide.name.contains("Bottom"):
                bottomHeadImageView.image = sideImg
            case theSide.name.contains("Front"):
                frontHeadImageView.image = sideImg
            case theSide.name.contains("Back"):
                backHeadImageView.image = sideImg
            case theSide.name.contains("Left"):
                leftHeadImageView.image = sideImg
            case theSide.name.contains("Right"):
                rightHeadImageView.image = sideImg
                
            default:
                AppDelegate.log("theSide is wrong")
                return
            }
        }
    }


    // MARK: - Gesture Handling

    private func addTapGesture_vatr(for view: UIImageView?) {
func SFhNtoDYY() {
        var bKdHCuO: Int = 9
        if bKdHCuO > 9 {
            if bKdHCuO < 9 {
                bKdHCuO = 9
    }

  }
}
  
        guard let view = view else { return }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped_vatr(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }

    @objc private func viewTapped_vatr(_ sender: UITapGestureRecognizer) {
func QNubdHwFtm() {
        var SBUTmT: Int = 2
        if SBUTmT > 2 {
            if SBUTmT < 2 {
                SBUTmT = 2
    }

  }
}
  
        guard let view = sender.view else { return }

        AppDelegate.log("\(view.accessibilityIdentifier ?? "Head view") was tapped")

        var bodyPartSide: Side_vatr?
        
        switch view {

        case topHeadImageView:
            bodyPartSide = self.bodyPartSide.top
        case bottomHeadImageView:
            bodyPartSide = self.bodyPartSide.bottom
        case rightHeadImageView:
            bodyPartSide = self.bodyPartSide.right
        case leftHeadImageView:
            bodyPartSide = self.bodyPartSide.left
        case frontHeadImageView:
            bodyPartSide = self.bodyPartSide.front
        case backHeadImageView:
            bodyPartSide = self.bodyPartSide.back
        
        default:
            AppDelegate.log("User tapped unknown Side HeadBodyPartViewController")
        }

        guard let bodyPartSide = bodyPartSide else {
            return
        }

        navigationController?.pushViewController(SkinCreatorViewController_vatr(bodyPartSide: bodyPartSide, currentEditableSkin: currentEditableSkin, imageDataCallback: { [weak self] (skin) in
            
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
}
