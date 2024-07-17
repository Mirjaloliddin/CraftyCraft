
import UIKit

class TorsoBodyPartViewController_vatr: UIViewController {
    
    var currentEditableSkin: SkinCreatedModel_vatr?
    var body: BodyPartSide_vatr = CubicHuman_tghty.BodyPart_vhgd.body
    
    @IBOutlet weak var backBody: UIImageView!
    @IBOutlet weak var leftBody: UIImageView!
    
    @IBOutlet weak var frontBody: UIImageView!
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var bottomBody: UIImageView!
    @IBOutlet weak var topBody: UIImageView!
    
    @IBOutlet weak var rightBody: UIImageView!
    
    private var gradientLayer: CALayer! = nil
    //MARK: - Init
    
    init(currentEditableSkin: SkinCreatedModel_vatr? = nil, body: BodyPartSide_vatr) {
        super.init(nibName: nil, bundle: nil)
        
        self.currentEditableSkin = currentEditableSkin
        self.body = body
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        AppDelegate.log("TorsoBodyPartViewController is Successfully deinited")
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        var ranrwedomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        
        super.viewDidLoad()
        
        
        
        //        let backgroundImageView = UIImageView(frame: view.bounds)
        //        backgroundImageView.image = UIImage(named: "Green Background")
        //        backgroundImageView.contentMode = .scaleAspectFill
        //        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        view.addSubview(backgroundImageView)
        //        view.sendSubviewToBack(backgroundImageView)
        
        navigationBar.backgroundColor = .clear
        setupBackground_vatr()
        
        addTapGesture_vatr(for: backBody)
        addTapGesture_vatr(for: frontBody)
        addTapGesture_vatr(for: leftBody)
        addTapGesture_vatr(for: rightBody)
        addTapGesture_vatr(for: topBody)
        addTapGesture_vatr(for: bottomBody)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var cpvatr_jqdefkit: Double {
            return 91.44397164701778
        }
        func sRsCgb() {
            var rjtPVvcH: Int = 4
            if rjtPVvcH > 4 {
                if rjtPVvcH < 4 {
                    rjtPVvcH = 4
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
    
    override func viewDidLayoutSubviews() {
        
        func auxdpZce() {
            var WhUta: Int = 2
            if WhUta > 2 {
                if WhUta < 2 {
                    WhUta = 2
                }
                
            }
        }
        
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
    }
    
    private func setupBackground_vatr() {
        func JTfXHQFw() {
            var zlfCdNWLE: Int = 7
            if zlfCdNWLE > 7 {
                if zlfCdNWLE < 7 {
                    zlfCdNWLE = 7
                }
                
            }
        }
        
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: Gestures
    
    func addTapGesture_vatr(for view: UIView) {
        func LDxeNI() {
            var ydPQNPV: Int = 4
            if ydPQNPV > 4 {
                if ydPQNPV < 4 {
                    ydPQNPV = 4
                }
                
            }
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped_vatr(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    
    @objc func viewTapped_vatr(_ sender: UITapGestureRecognizer) {
        func GTTLWk() {
            var RdFVfEGUfb: Int = 4
            if RdFVfEGUfb > 4 {
                if RdFVfEGUfb < 4 {
                    RdFVfEGUfb = 4
                }
                
            }
        }
        
        
        guard let view = sender.view else { return }
        var bodyPartSide: Side_vatr?
        
        switch view {
            
        case topBody:
            bodyPartSide = body.top
        case bottomBody:
            bodyPartSide = body.bottom
        case leftBody:
            bodyPartSide = body.left
        case rightBody:
            bodyPartSide = body.right
        case frontBody:
            bodyPartSide = body.front
        case backBody:
            bodyPartSide = body.back
            
        default:
            AppDelegate.log("User tapped unknown bodyView")
            break
        }
        guard let bodyPartSide = bodyPartSide else {
            return
        }
        
        self.navigationController?.pushViewController(SkinCreatorViewController_vatr(bodyPartSide: bodyPartSide, currentEditableSkin: currentEditableSkin, imageDataCallback: { [weak self] (skin) in
            
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
            
        }), animated:  true)
    }
    
    
    //MARK: Private func
    
    private func colorSides_vatr() {
        func AvdbtkOun() {
            var LiCpHbg: Int = 1
            if LiCpHbg > 1 {
                if LiCpHbg < 1 {
                    LiCpHbg = 1
                }
                
            }
        }
        
        
        let imageViews: [UIImageView] = [topBody, bottomBody, leftBody, rightBody, frontBody, backBody]
        imageViews.forEach({ $0.layer.magnificationFilter = .nearest })
        imageViews.forEach({ $0.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!) })
        
        let sides = [
            body.top,
            body.bottom,
            body.back,
            body.front,
            body.left,
            body.right
        ]
        
        for theSide in sides {
            let sideImg = currentEditableSkin?.skinAssemblyDiagram?.extractSubImage_vatr(
                startX: CGFloat(theSide.startX),
                startY: CGFloat(theSide.startY),
                width: CGFloat(theSide.width),
                height: CGFloat(theSide.height))
            
            switch true {
            case theSide.name.contains("Top"):
                topBody.image = sideImg
            case theSide.name.contains("Bottom"):
                bottomBody.image = sideImg
            case theSide.name.contains("Front"):
                frontBody.image = sideImg
            case theSide.name.contains("Back"):
                backBody.image = sideImg
            case theSide.name.contains("Left"):
                leftBody.image = sideImg
            case theSide.name.contains("Right"):
                rightBody.image = sideImg
                
            default:
                AppDelegate.log("theSide is wrong")
                return
            }
        }
        
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr89(_ sender: UIButton) {
        var cpvatr_swlcczvv: Double {
            return 73.3219640299283
        }
        func uPTNQxzd() {
            var lNPtGqnoYX: Int = 1
            if lNPtGqnoYX > 1 {
                if lNPtGqnoYX < 1 {
                    lNPtGqnoYX = 1
                }
                
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
}
