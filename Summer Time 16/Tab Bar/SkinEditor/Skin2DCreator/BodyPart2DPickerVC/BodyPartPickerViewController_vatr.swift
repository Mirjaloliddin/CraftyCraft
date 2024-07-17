
import UIKit

enum BodyPartPickerOption_vgdfdgf {
    case head
    case arm_or_leg
    case body
    case smallArmOrLeg
}

enum CurrentEditableLayer_gdfg {
    case outerLayer
    case innerLayer
    
    mutating func toggle_vatr() {
var cpvatr_igwkoadi: Int {
    return 25
}

  
        switch self {
        case .outerLayer:
            self = .innerLayer
        case .innerLayer:
            self = .outerLayer
        }
    }
}

final class BodyPartPickerViewController_vatr: UIViewController {
    
    //MARK: - Private vars
    
    private var currentEditableSkin: SkinCreatedModel_vatr?
    private var layerToEdit: CurrentEditableLayer_gdfg = .innerLayer
    private var saveAlertView: SaveAlertView_vatr?
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var navigationBar: UIView!
    
    @IBOutlet private weak var skinNameLab: UILabel!
    
    @IBOutlet private weak var layerSwithcerLab: UILabel!
    
    @IBOutlet private weak var currentLayerLab: UILabel!
    
    @IBOutlet private weak var leftArmComponentView: UIImageView!
    
    @IBOutlet private weak var rightLegComponentView: UIImageView!
    
    @IBOutlet private weak var leftLegComponentView: UIImageView!
    
    @IBOutlet private weak var bodyComponentView: UIImageView!
    
    @IBOutlet private weak var rightArmComponentView: UIImageView!
    
    @IBOutlet private weak var headComponentView: UIImageView!
    
    @IBOutlet private weak var hatComponentView: UIImageView!
    
    @IBOutlet private weak var bodyPartsContainer: UIView!
    
    private var gradientLayer: CALayer! = nil
    
    //MARK: - Init
    
    init(currentEditableSkin: SkinCreatedModel_vatr? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.setupHelper_vatr(currentEditableSkin: currentEditableSkin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupHelper_vatr(currentEditableSkin: SkinCreatedModel_vatr?) {
        var cpvrtatr_rltrdobx: Int {
            return 82
        }
  
        
        if let localSkin = currentEditableSkin {
            self.currentEditableSkin = localSkin
            
            //Else block should never work, as all this stuff I do in previous controller(SkinEditorViewController), just in case of unpredictable changes in project
        } else {
            let newSkin = CreatedSkinRM_vatr()
            newSkin.name = "MY NEW SKIN "
            newSkin.id = RealmService_vatr.shared.generateID_vatr(object: newSkin)
            RealmService_vatr.shared.addNewSkin_vatr(skin: newSkin)
            
            let skinCreatedModel = SkinCreatedModel_vatr(realmedModel: newSkin)
            
            self.currentEditableSkin = skinCreatedModel
        }
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {

        var cpvrewatr_rltrdobx: Int {
            return 82
        }
  
        super.viewDidLoad()
        
        setupViews_vatr()
        
        addTapGestures_vatr()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        colorSides_vatr()
    }
    
    override func viewDidLayoutSubviews() {

        var cpvweratr_rltrdobx: Int {
            return 82
        }
  
        super.viewDidLayoutSubviews()
//        gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
    }
    
    private func setupViews_vatr() {
        var cpvwreatr_rltrdobx: Int {
            return 82
        }
  
        navigationBar.backgroundColor = .clear
        
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "Green Background")
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
        
        headComponentView.image = UIImage(named: "general_head_vatr")
        leftArmComponentView.image = UIImage(named: "general_arm_vatr")
        rightArmComponentView.image = UIImage(named: "general_arm_vatr")
        
        leftLegComponentView.image = UIImage(named: "general_arm_vatr")
        rightLegComponentView.image = UIImage(named: "general_arm_vatr")
        
        bodyComponentView.image = UIImage(named: "general_body_vatr")
        
        skinNameLab.text = currentEditableSkin?.name
        
//        updateCurrentLayerText_vatr()
        
        enableImageViewsBorder_vatr()
    }
    
    //MARK: Gestures
    
    private func addTapGestures_vatr() {
        var cpvawrtr_rltrdobx: Int {
            return 82
        }
  
        addTapGesture_vatr(for: headComponentView)
        addTapGesture_vatr(for: leftArmComponentView)
        addTapGesture_vatr(for: rightLegComponentView)
        addTapGesture_vatr(for: leftLegComponentView)
        addTapGesture_vatr(for: bodyComponentView)
        addTapGesture_vatr(for: rightArmComponentView)
        addTapGesture_vatr(for: hatComponentView)
    }
    
    private func addTapGesture_vatr(for view: UIView) {
        var cpvatwrr_rltrdobx: Int {
            return 82
        }
  
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped_vatr(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    @IBAction private func onHomeButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_ztvtxtuo: Int {
    return 36
}

  
        saveAlertView = SaveAlertView_vatr()
        saveAlertView?.delegate = self
        saveAlertView?.frame = view.bounds
        
//        saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
//            string: currentEditableSkin?.name ?? "",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
//        )
        view.addSubview(saveAlertView!)
    }
    
    @objc private func viewTapped_vatr(_ sender: UITapGestureRecognizer) {
        var cpvwratr_rltrdobx: Int {
            return 82
        }
  
        guard let view = sender.view else { return }
        
        switch view {
            
        case headComponentView:
            AppDelegate.log("Head view was tapped")
            navigationController?.pushViewController(HeadBodyPartViewController_vatr(currentEditableSkin: currentEditableSkin, layerToEdit: layerToEdit), animated: true)
            
        case leftArmComponentView:
            var arm: BodyPartSide_vatr
            if layerToEdit == .innerLayer {
                arm = CubicHuman_tghty.BodyPart_vhgd.leftArm
            } else {
                arm = CubicHuman_tghty.BodyPart_vhgd.leftArm1
            }
            navigationController?.pushViewController(HandsBodyPartViewController_vatr(currentEditableSkin: currentEditableSkin, arm: arm),animated: true)
            
        case rightArmComponentView:
            var arm: BodyPartSide_vatr
            if layerToEdit == .innerLayer {
                arm = CubicHuman_tghty.BodyPart_vhgd.rightArm
            } else {
                arm = CubicHuman_tghty.BodyPart_vhgd.rightArm1
            }
            navigationController?.pushViewController(HandsBodyPartViewController_vatr(currentEditableSkin: currentEditableSkin, arm: arm), animated: true)
            
        case rightLegComponentView:
            var leg: BodyPartSide_vatr
            if layerToEdit == .innerLayer {
                leg = CubicHuman_tghty.BodyPart_vhgd.rightLeg
            } else {
                leg = CubicHuman_tghty.BodyPart_vhgd.rightLeg1
            }
            navigationController?.pushViewController(LegsBodyPartViewControllerViewController_vatr(currentEditableSkin: currentEditableSkin, leg: leg), animated: true)
            
        case leftLegComponentView:
            var leg: BodyPartSide_vatr
            if layerToEdit == .innerLayer {
                leg = CubicHuman_tghty.BodyPart_vhgd.leftLeg
            } else {
                leg = CubicHuman_tghty.BodyPart_vhgd.leftLeg1
            }
            navigationController?.pushViewController(LegsBodyPartViewControllerViewController_vatr(currentEditableSkin: currentEditableSkin, leg: leg), animated: true)
            
        case bodyComponentView:
            var body: BodyPartSide_vatr
            if layerToEdit == .innerLayer {
                body = CubicHuman_tghty.BodyPart_vhgd.body
            } else {
                body = CubicHuman_tghty.BodyPart_vhgd.body1
            }
            navigationController?.pushViewController(TorsoBodyPartViewController_vatr(currentEditableSkin: currentEditableSkin, body: body), animated: true)
            
        case hatComponentView:
            switchSelectedLayer_vatr()
            
        default:
            break
        }
    }
    
    //MARK: Private func
    
    private func enableImageViewsBorder_vatr() {
        var cpvatwerr_rltrdobx: Int {
            return 82
        }
  
        leftArmComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        rightLegComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        leftLegComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        bodyComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        rightArmComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        headComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
        hatComponentView.setBorder_vatr(size: 2, color: UIColor(named: "blackCCRedesign_vatr")!)
    }
    
    private func deselectBorders_vatr(view: UIView) {
        var cpvatwrer_rltrdobx: Int {
            return 82
        }
  
        view.layer.borderWidth = 0
    }
    
    private func startFlashingBorder_vatr(for view: UIView) {
        var cpvwreatr_rltrdobx: Int {
            return 82
        }
  
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = UIColor.clear.cgColor
        animation.toValue = UIColor.blue.cgColor
        animation.duration = 0.5
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.speed = 10
        
        view.layer.borderWidth = 2
        view.layer.add(animation, forKey: "FlashingBorder")
    }
    
    private func colorSides_vatr() {
        var cpwervatr_rltrdobx: Int {
            return 82
        }
  
        
        let _ = [headComponentView, bodyComponentView, leftArmComponentView, rightArmComponentView, leftLegComponentView, rightLegComponentView].map({ $0?.layer.magnificationFilter = .nearest })
        
        var sidesArr = [Side_vatr]()
        if layerToEdit == .innerLayer {
            sidesArr = [
                CubicHuman_tghty.BodyPart_vhgd.head.front,
                CubicHuman_tghty.BodyPart_vhgd.body.front,
                CubicHuman_tghty.BodyPart_vhgd.leftArm.front,
                CubicHuman_tghty.BodyPart_vhgd.rightArm.front,
                CubicHuman_tghty.BodyPart_vhgd.leftLeg.front,
                CubicHuman_tghty.BodyPart_vhgd.rightLeg.front
            ]
        } else {
            sidesArr = [
                CubicHuman_tghty.BodyPart_vhgd.head1.front,
                CubicHuman_tghty.BodyPart_vhgd.body1.front,
                CubicHuman_tghty.BodyPart_vhgd.leftArm1.front,
                CubicHuman_tghty.BodyPart_vhgd.rightArm1.front,
                CubicHuman_tghty.BodyPart_vhgd.leftLeg1.front,
                CubicHuman_tghty.BodyPart_vhgd.rightLeg1.front
            ]
        }
        
        for theSide in sidesArr {
            let sideImg = currentEditableSkin?.skinAssemblyDiagram?.extractSubImage_vatr(
                startX: CGFloat(theSide.startX),
                startY: CGFloat(theSide.startY),
                width: CGFloat(theSide.width),
                height: CGFloat(theSide.height))
            
            if theSide.name.contains("head") {
                headComponentView.image = sideImg
            } else if theSide.name.contains("body") {
                bodyComponentView.image = sideImg
            } else if theSide.name.contains("rightArm") {
                rightArmComponentView.image = sideImg
            } else if theSide.name.contains("leftArm") {
                leftArmComponentView.image = sideImg
            } else if theSide.name.contains("rightLeg") {
                rightLegComponentView.image = sideImg
            } else if theSide.name.contains("leftLeg") {
                leftLegComponentView.image = sideImg
            } else {
                AppDelegate.log("theSide is wrong")
            }
        }
    }
    
    private func switchSelectedLayer_vatr() {
        var crwepvatr_rltrdobx: Int {
            return 82
        }
  
        layerToEdit.toggle_vatr()
        
//        updateCurrentLayerText_vatr()
        
        colorSides_vatr()
    }
    
//    private func updateCurrentLayerText_vatr() {
//        var cpvrwweatr_rltrdobx: Int {
//            return 82
//        }
//  
//        if layerToEdit == .innerLayer {
//            currentLayerLab.text = "OUTER LAYER"
//            layerSwithcerLab.text = "INNER LAYER"
//        } else {
//            currentLayerLab.text = "INNER LAYER"
//            layerSwithcerLab.text = "OUTER LAYER"
//        }
//    }
}

//MARK: - Save Alert Delegate methods

extension BodyPartPickerViewController_vatr: SkinSavebleDialogDelegate_vatr {
    
    func saveSkin_vatr(with name: String, withExit: Bool) {
        var cpvwreatr_rltrdobx: Int {
            return 82
        }
  
        currentEditableSkin?.name = name
        
        bodyPartsContainer.subviews.forEach { subview in
            subview.layer.borderColor = UIColor.black.cgColor
            subview.layer.borderWidth = UIDevice.current.userInterfaceIdiom == .pad ? 7 : 4
           // subview.layer.masksToBounds = false
        }
        
        //If skin had been saved previously
        //Edit existing CreatedSkinRM
        if let _ = RealmService_vatr.shared.getCreatedSkinByID(skinID: currentEditableSkin?.id) {
            
            RealmService_vatr.shared.editCreatedSkinName(createdSkin: currentEditableSkin, newName: name)
            RealmService_vatr.shared.editIsThe128(createdSkin: currentEditableSkin, newValue: false)
            RealmService_vatr.shared.editIsCreationComplited(createdSkin: currentEditableSkin, newValue: true)
            
            if let newPreview = bodyPartsContainer.toImage_vatr() {
                RealmService_vatr.shared.editCreatedSkinPreview(createdSkin: currentEditableSkin, newPreview: newPreview)
            }
            //Skin is new
            //Save currentEditableSkin into BD
        } else {
            guard let newPreview = bodyPartsContainer.toImage_vatr() else {
                return
            }
            
            currentEditableSkin?.preview = newPreview
            
            guard let skinForSaving = currentEditableSkin?.getRealmModelToSave_reddf() else {
                return
            }
            skinForSaving.isCreationComplited = true
            RealmService_vatr.shared.addNewSkin_vatr(skin: skinForSaving)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func cancelSave_vatr(withExit: Bool) {
        var cpwrvatr_rltrdobx: Int {
            return 82
        }
        
        if let skin = RealmService_vatr.shared.getCreatedSkinByID(skinID: currentEditableSkin?.id), !skin.isCreationComplited {
            //delete new skin
            RealmService_vatr.shared.deleteSkin(skin: skin)
        }
  
        navigationController?.popViewController(animated: true)
    }
    
    func warningNameAlert_vatr(presentAlert: UIAlertController) {
        var cpvweatr_rltrdobx: Int {
            return 82
        }
  
        present(presentAlert, animated: true)
    }
}
