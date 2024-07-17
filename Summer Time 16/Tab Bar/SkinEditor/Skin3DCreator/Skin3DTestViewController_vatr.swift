import UIKit
import SceneKit


enum SkinAssemblyDiagramSize_vatr {
    case size64x64
    case size128x128
}

protocol BrashSizeCangableDelegate_vatr: AnyObject {
    func changeBrashSize_vatr(to size: BrashSize_gfdg)
}

protocol BodyPartsHiddebleDelegate_vatr: AnyObject {
    func hideBodyPart(of type: StivesBodyPart_vatr, completion: @escaping (_ layerEditing: BodyPartEditState_vatr) -> Void)
}

protocol SkinSavebleDialogDelegate_vatr: AnyObject {
    func saveSkin_vatr(with name: String, withExit: Bool)
    func cancelSave_vatr(withExit: Bool)
    func warningNameAlert_vatr(presentAlert: UIAlertController)
}

class Skin3DTestViewController_vatr: UIViewController {
    //MARK: Properties
    private lazy var minecraftSkinManager: MinecraftSkinManagerProtocol_vatr = MinecraftSkinManager_vatr()
    
    //MARK: Properties
    
    var scnModel: SceneLogicModel_vatr!
    
    var editorSkinModel: EditorSkinModel_gfghf!
    
    var colorManager3D = ColorManager3D_vatr()
    
    var toolBarSelectedItem: ToolBar3DSelectedItem_vfgdf = .pencil {
        didSet {
//            colorsBrashContainerView.isHidden = false
            
            switch toolBarSelectedItem {
            case .pencil, .fill, .noise, .undo:
                break
            case .eraser:
                break
 //           case .picker:
  //              break
            case .brash:
                break
            }
            manageGestures()
        }
    }
    
//    var toolBarSelectedItem: ToolBar3DSelectedItem = .pencil {
//        didSet {
////            brashSizeView.currentBrashTool = toolBarSelectedItem
////            colorsBrashContainerView.isHidden = false
//        }
//    }
    
    var brashSize = 1
    
    @IBOutlet weak var noiseView: UIView!
    @IBOutlet weak var sizesView: UIView!
    
    @IBOutlet weak var noiseSlider: UISlider!{
        didSet {
            let thumbImage = UIImage(named: "thumbImage")
            noiseSlider.setThumbImage(thumbImage, for: .normal)
            noiseSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }
    
    var magnifyingGlassView: MagnifyingGlassView_vatr?
    var saveAlertView: SaveAlertView_vatr?
    
    var tapGestureOnSCNScene = UITapGestureRecognizer()
    var doubleTapGestureOnScene = UITapGestureRecognizer()
    var panGestureOnSCNScene = UIPanGestureRecognizer()
    var panForColorPickerRecognizer = UIPanGestureRecognizer()
    
    var alertWindow: UIWindow?
    
    //MARK: IBOotlet
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    private var shareButton: UIButton = UIButton()
    
    @IBOutlet weak var skinNameLabel: UILabel!
    
    @IBOutlet weak var sceneView: SCNView!
     //   @IBOutlet weak var brashSizeView: BrashSizeView!
    
    @IBOutlet weak var smallStiveView: SmallModelView_vatr!
    
    @IBOutlet weak var colorsBrashContainerView: UIView!
    
    @IBOutlet weak var rotationSkinModelButton: UIButton!
    
    @IBOutlet weak var toolsStackView: UIStackView!
    
    @IBOutlet weak var customToolPicker: CustomToolPickerView_vatr!
    
    @IBOutlet weak var color3DCollection: UICollectionView!
    //Tools
    //
    @IBOutlet weak var sizesCollectionView: UICollectionView!
    private lazy var sizeManager = SizesManager(parent: self)
    
    @IBOutlet weak var pencilLab: UILabel!
    @IBOutlet weak var pencilBtn: UIButton!
    
    @IBOutlet weak var eraserLab: UILabel!
    @IBOutlet weak var eraserBtn: UIButton!
    
    @IBOutlet weak var dropperLab: UILabel!
    @IBOutlet weak var dropperBtn: UIButton!
    
    @IBOutlet weak var fillLab: UILabel!
    @IBOutlet weak var fillBtn: UIButton!
    
    @IBOutlet weak var noiseLab: UILabel!
    @IBOutlet weak var noiseBtn: UIButton!
    
    @IBOutlet weak var undoLab: UILabel!
    @IBOutlet weak var undoBtn: UIButton!
    
    @IBOutlet weak var undoContainerView: UIView!
    @IBOutlet weak var noiseContainerView: UIView!
    @IBOutlet weak var pencilContainerView: UIView!
    @IBOutlet weak var eraserContainerView: UIView!
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet weak var fillContainerView: UIView!
    
//    @IBOutlet var colorButtonsOutletCollection: [UIButton]!
    @IBOutlet weak var dropperButton: UIButton!
    
    private var skinDidCreated = false
    
    var startingPointOfView: SCNNode?
    
    
    
    @IBOutlet weak var sizeBackV: UIView!
    
    
    @IBOutlet weak var colorBackV: UIView!
    
    
    //MARK: - IBActions
    
    @IBAction func rotationCameraControllButtonAction_vatr(_ sender: UIButton) {
var cpvatr_xidooeli: Double {
    return 73.92979936900832
}

  
        if smallStiveView.isHidden {
            smallStiveView.isHidden = false
            tapGestureOnSCNScene.isEnabled = true
            panGestureOnSCNScene.isEnabled = true
            panForColorPickerRecognizer.isEnabled = false
            sceneView.allowsCameraControl = false
        } else {
            sceneView.allowsCameraControl = true
            tapGestureOnSCNScene.isEnabled = false
            panGestureOnSCNScene.isEnabled = false
            panForColorPickerRecognizer.isEnabled = false
            smallStiveView.isHidden = true
        }
        hideMagnifyingGlass()
    }
    
    @IBAction func onToolBarPencilButtonTapped_vatr(_ sender: UIButton) {
  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: pencilLab)
        updateBrashSizeHiddenStatus_vatr2(.pencil)
        toolBarSelectedItem = .pencil
    }
    
    @IBAction func onToolBarEraserButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_eesachnl: Double {
    return 32.3811861958319
}

  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: eraserLab)
        updateBrashSizeHiddenStatus_vatr2(.eraser)
        toolBarSelectedItem = .eraser
    }
    
    @IBAction func onToolBarBrashButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_iftevwqm: Int {
    return 20
}

  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: dropperLab)
        updateBrashSizeHiddenStatus_vatr2(.brash)
        toolBarSelectedItem = .brash
        
    }
    
    @IBAction func onToolBarFillButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_nakfnkmp: Double {
    return 8.740976898072095
}

  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: fillLab)
        updateBrashSizeHiddenStatus_vatr2(.fill)
        toolBarSelectedItem = .fill
    }
    
    @IBAction func onToolBarNoiseButtonTapped_vatr_vatr(_ sender: UIButton) {
var cpvatr_jqydkmkk: Double {
    return 25.195841610550907
}

  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: noiseLab)
        updateBrashSizeHiddenStatus_vatr2(.noise)
        toolBarSelectedItem = .noise
    }
    
    @IBAction func onToolBarUndoButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_dcebtmvu: Double {
    return 71.24554641148329
}

  
        hideMagnifyingGlass()
        manageSelectedToolUI_ter(tappedTool: sender, tappedLab: undoLab)
        editorSkinModel.makeUndoDrawCommand_vatr()
        updateBrashSizeHiddenStatus_vatr2(.undo)
        toolBarSelectedItem = .undo
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_rdctwqxf: Int {
    return 30
}

  
        if skinDidCreated {
            navigationController?.popViewController(animated: true)
        } else  {
            saveAlertView = SaveAlertView_vatr()
            saveAlertView?.delegate = self
            saveAlertView?.dialogTextLabel.text = "Save before exit".uppercased()
            saveAlertView?.frame = view.bounds
            saveAlertView?.setSkinNameSaveTextField.isHidden = true
            saveAlertView?.withExit = true
            saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
                string: skinNameLabel.text ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
            )
            view.addSubview(saveAlertView!)
        }
    }
    
    @IBAction func onNavBarSafeButtonTapped_vatr231(_ sender: UIButton) {
var cpvatr_jorkudqg: Int {
    return 1
}

  
        
        saveAlertView = SaveAlertView_vatr()
        saveAlertView?.delegate = self
        saveAlertView?.frame = view.bounds
        saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
            string: skinNameLabel.text ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
        )
        view.addSubview(saveAlertView!)
    }
    
    @IBAction func colorPaletButtonTapped_vatr13(_ sender: UIButton) {
var cpvatr_fjuutegc: Double {
    return 39.769235440824616
}

  
        presentCustomAlert()
        hideMagnifyingGlass()
    }

    
    @IBAction func colorPickerButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_hurxadwb: Double {
    return 51.566923651919836
}

  
        sender.isSelected = true
        
        if magnifyingGlassView == nil {
            panForColorPickerRecognizer.isEnabled = true
            tapGestureOnSCNScene.isEnabled = false
            panGestureOnSCNScene.isEnabled = false
            
            magnifyingGlassView = MagnifyingGlassView_vatr(size: 60)
            magnifyingGlassView?.center = sceneView.center
            magnifyingGlassView?.backgroundColor = .white
            
            sceneView.addSubview(magnifyingGlassView!)
        } else {
            hideMagnifyingGlass()
        }
    }
    
    
    @IBAction func sliderBtnTapped(_ sender: Any) {
        noiseView.isHidden = !noiseView.isHidden
    }
    
    
    
    
    //MARK: - Init
    
    init(currentEditableSkin: SkinCreatedModel_vatr, skinAssemblyDiagramSize: SkinAssemblyDiagramSize_vatr) {
        super.init(nibName: nil, bundle: nil)
        scnModel = SceneLogicModel_vatr(assemblyDiagramSize: skinAssemblyDiagramSize, currentEditableModel: currentEditableSkin)
        editorSkinModel = EditorSkinModel_gfghf(viewController: self, skinCreatedModel: currentEditableSkin, assemblyDiagramSize: skinAssemblyDiagramSize)
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {

        var cpvatwrr_tiwftntf: Int {
            return 83
        }
  
        super.viewDidLoad()
        

        setupColorColletion_vatr2()
        setupSizesColletion()

        colorManager3D.delegate = self
 //       brashSizeView.delegate = self
        smallStiveView.delegate = self

        manageSelectedToolUI_ter(tappedTool: pencilBtn, tappedLab: pencilLab)
        toolBarSelectedItem = .pencil
        
        setupMyScene_vatr2()
        setupSlider_vatr2()
        setupUI_vatr2()
        setupToolBarAction_vatr2()
        
        //background
        setupBackground_vatr()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        color3DCollection.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
        sizesCollectionView.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
  
        sceneView.defaultCameraController.rotateBy(x: 1.1, y: 1.1) // just init inner property (fixed bug with flickers)
    }
    
    deinit {
        AppDelegate.log("Skin3DTestViewController - deinited!!!")
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }

    //MARK: Private functions
    
    private func setupSlider_vatr2() {


  
        noiseSlider.minimumValue = 0.1
        noiseSlider.maximumValue = 0.9
        noiseSlider.value = 0.3
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        colorBackV.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        colorBackV.layer.cornerRadius = 40
        Gradient.setupGradient(view: sizeBackV)
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        Gradient.setupGradient(view: view)
        }

    private func setupBackground_vatr() {
var cpvatr_rltrdobx: Int {
    return 82
}
gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func updateBrashSizeHiddenStatus_vatr2(_ item: ToolBar3DSelectedItem_vfgdf) {
        var cpvawertr_rltrdobx: Int {
            return 82
        }

  
//        if item == .fill || item == .undo {
//            brashSizeView.isHidden = true
//            return
//        }
//
//        if !brashSizeView.isHidden {
//            brashSizeView.isHidden.toggle()
//        } else {
//            brashSizeView.isHidden = toolBarSelectedItem != item
//        }
    }
    
    func setupColorColletion_vatr2() {
var cpvatr_jkknotsj: Double {
    return 13.016566270434513
}

  
        color3DCollection.delegate = self
        color3DCollection.dataSource = self
        color3DCollection.register(UINib(nibName: "ColorCollectionCell_vatr", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionCell_vatr")
        color3DCollection.setCollectionViewLayout(.makeRoundedLayout(), animated: false)
    }
    
    private func setupSizesColletion() {
var cpvatr_squhoxhg: Int {
    return 49
}

  
        sizesCollectionView.delegate = sizeManager
        sizesCollectionView.dataSource = sizeManager
        sizesCollectionView.register(SizeCollectionViewCell_vatr.self, forCellWithReuseIdentifier: SizeCollectionViewCell_vatr.reuseID)
    }
    
    private func setupToolBarAction_vatr2() {
var cpvatr_qtemouai: Int {
    return 11
}

  
        undoContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(undoTap_vatr23)))
        pencilContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pencilTap_vatr234)))
        eraserContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eraserTap_vatr43)))
        pickerContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pickerTap_vatr)))
        fillContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fillTap_vatr32)))
        noiseContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(noiseTap_vatr32)))
    }
    
    @objc func undoTap_vatr23() {
var cpvatr_epzkjxlw: Int {
    return 41
}

  
        undoBtn.sendActions(for: .touchUpInside)
    }
    @objc func pencilTap_vatr234() {
var cpvatr_czgtemtp: Double {
    return 93.80876347952803
}

  
        pencilBtn.sendActions(for: .touchUpInside)
    }
    @objc func eraserTap_vatr43() {
var cpvatr_ziftejvk: Int {
    return 77
}

  
        eraserBtn.sendActions(for: .touchUpInside)
    }
    @objc func pickerTap_vatr() {
var cpvatr_mmhrasee: Double {
    return 38.06854067195137
}

  
        dropperBtn.sendActions(for: .touchUpInside)
    }
    @objc func fillTap_vatr32() {
var cpvatr_wunustsa: Int {
    return 72
}

  
        fillBtn.sendActions(for: .touchUpInside)
    }
    
    @objc func noiseTap_vatr32() {
var cpvatr_wunustsa: Int {
    return 72
}

  
        noiseBtn.sendActions(for: .touchUpInside)
    }
    
    private func setupMyScene_vatr2() {
var cpvatr_dtegulgt: Double {
    return 51.473132033942214
}

  
        
        sceneView.scene = scnModel.scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true // <--- when user go to edit mode
        sceneView.showsStatistics = false
        startingPointOfView = sceneView.pointOfView
        
        if let gestureRecognizers = sceneView.gestureRecognizers {
            for (index, gesture) in gestureRecognizers.enumerated() {

                if index == 0 || index == 2 {
                    gesture.isEnabled = false
                    sceneView.removeGestureRecognizer(gesture)
                }
            }
        }
        
        panGestureOnSCNScene = UIPanGestureRecognizer(target: self, action: #selector(panOnSceneAction_vatre4(_:)))
        panGestureOnSCNScene.maximumNumberOfTouches = 1

        panForColorPickerRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanGEtureforPicker_vatr23(_:)))
        panForColorPickerRecognizer.maximumNumberOfTouches = 1

        // Single Tap
        tapGestureOnSCNScene = UITapGestureRecognizer(target: self, action: #selector(tapOnSceneAction_vatr32(_:)))
        tapGestureOnSCNScene.numberOfTapsRequired = 1

        // Double Tap
        doubleTapGestureOnScene = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap_vatr32))
        doubleTapGestureOnScene.numberOfTapsRequired = 2

        doubleTapGestureOnScene.require(toFail: panForColorPickerRecognizer)
        doubleTapGestureOnScene.require(toFail: panGestureOnSCNScene)

        tapGestureOnSCNScene.delaysTouchesBegan = true

        doubleTapGestureOnScene.delaysTouchesBegan = true

        sceneView.addGestureRecognizer(tapGestureOnSCNScene)
        sceneView.addGestureRecognizer(doubleTapGestureOnScene)

        sceneView.addGestureRecognizer(panForColorPickerRecognizer)
        sceneView.addGestureRecognizer(tapGestureOnSCNScene)
        sceneView.addGestureRecognizer(panGestureOnSCNScene)
    }

    private func setupUI_vatr2() {
var cpvatr_kyiqwwgw: Int {
    return 3
}

  
        setupBrushSizeView_trew()
        skinNameLabel.text = editorSkinModel.skinCreatedModel?.name.uppercased()
        skinNameLabel.font = UIFont.kufamFont(.bold, size: 22)
    }

    //MARK: Setup brushSize
    
    private func setupBrushSizeView_trew() {
var cpvatr_fbknucuk: Int {
    return 47
}

  
//        view.bringSubviewToFront(brashSizeView)
    }
    
    
    
    private func manageSelectedToolUI_ter(tappedTool: UIButton, tappedLab: UILabel) {
var cpvatr_txvcmtlp: Int {
    return 66
}

  
        
        let nonSelectedColor = UIColor(named: "placeholderCCRedesign_vatr")
        let selectedColor = UIColor(named: "blackCCRedesign_vatr")
        
        let toolBtns = [
            pencilBtn,  eraserBtn,
            dropperBtn, fillBtn,
            noiseBtn, undoBtn
        ]
        
        let toolLabs = [
            pencilLab,  eraserLab,
            dropperLab, fillLab,
            noiseLab, undoLab
        ]
        
 //       toolLabs.forEach({ $0?.textColor = nonSelectedColor })
        toolLabs.forEach { lab in
            if lab == undoLab {
                lab?.textColor = #colorLiteral(red: 0, green: 0.7749013305, blue: 0.9781914353, alpha: 1)
            } else {
                lab?.textColor = .white
            }
        }
        toolBtns.forEach({ $0?.isSelected = false })
        if tappedTool == undoBtn {
            undoLab.textColor = #colorLiteral(red: 0, green: 0.7749013305, blue: 0.9781914353, alpha: 1)
        } else {
            tappedLab.textColor = .white
        }
 //       tappedLab.textColor = selectedColor
        tappedTool.isSelected = true
    }
    
    private func manageGestures() {
var cpvatr_yeikxprw: Double {
    return 34.95878625882195
}

  

        switch toolBarSelectedItem {
        case .undo:

            panForColorPickerRecognizer.isEnabled = false
            tapGestureOnSCNScene.isEnabled = false
            panGestureOnSCNScene.isEnabled = false
            
            
           //  viewEditor.layer.sublayers?.forEach({  $0.removeAllAnimations() })
            
            sizesView.isHidden = toolBarSelectedItem != .pencil
            noiseView.isHidden = toolBarSelectedItem != .noise
      
            
        case .pencil, .fill, .noise, .eraser, .brash:
     //       longPressGestureRecognizer?.isEnabled = true
            panForColorPickerRecognizer.isEnabled = false
            tapGestureOnSCNScene.isEnabled = true
            panGestureOnSCNScene.isEnabled = true
            
            
            
            // viewEditor.layer.sublayers?.forEach({  $0.removeAllAnimations() })
            
            sizesView.isHidden = toolBarSelectedItem != .pencil && toolBarSelectedItem != .eraser && toolBarSelectedItem != .noise && toolBarSelectedItem != .brash
//            noiseView.isHidden = toolBarSelectedItem != .noise
            
        }
    }
    
    
    func hideMagnifyingGlass() {
var cpvatr_knwfbjpm: Int {
    return 57
}

  
        if magnifyingGlassView != nil {
            dropperButton?.isSelected = false
            
            magnifyingGlassView?.removeFromSuperview()
            magnifyingGlassView = nil
            
            panForColorPickerRecognizer.isEnabled = false
            tapGestureOnSCNScene.isEnabled = true
            panGestureOnSCNScene.isEnabled = true
        }
    }
    
    private func showSavedSkin() {
var cpvatr_jwvxmrdx: Int {
    return 18
}

  
        skinNameLabel.isHidden = false
      //   skinNameLabel.text =
        saveButton.isHidden = true
   //     shareButton.isHidden = false
        rotationSkinModelButton.isHidden = true
        customToolPicker.isHidden = true
  //      brashSizeView.isHidden = true
  //      colorsBrashContainerView.isHidden = true
  //      colorsBrashContainerView.superview?.isHidden = true
        toolsStackView.isHidden = true
        panForColorPickerRecognizer.isEnabled = false
        tapGestureOnSCNScene.isEnabled = false
        panGestureOnSCNScene.isEnabled = false
        
        sceneView.allowsCameraControl = true
        
        setupDownloadAndShareButtons()
    }
    
    private func setupDownloadAndShareButtons() {
var cpvatr_pvwcairm: Int {
    return 71
}

  
        
        let stackHeight: CGFloat = 54
        
        let button1 = UIButton()
        button1.setTitle("DOWNLOAD", for: .normal)
        button1.backgroundColor = .black
        button1.titleLabel?.font = UIFont.kufamFont(.bold, size: 20)
        
        button1.addTarget(self, action: #selector(downloadExportAction_wew), for: .touchUpInside)
        button1.roundCorners_vatr(.allCorners, radius: stackHeight / 2)
        view.addSubview(button1)
        
//        shareButton.backgroundColor = UIColor(named: "blackCCRedesign_vatr")
        shareButton.setImage(.init(named: "ShareButton"), for: .normal)

        
   //     shareButton.imageView?.contentMode = .scaleAspectFit
        
        shareButton.addTarget(self, action: #selector(shareAction_wew), for: .touchUpInside)
//        shareButton.roundCorners(.allCorners, radius: stackHeight / 2)
        view.addSubview(shareButton)
                
//        let containerView = UIView()
//        containerView.backgroundColor = .white
//        view.addSubview(containerView)
        
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.spacing = 12
//
//        stackView.addArrangedSubview(button1)
//        stackView.addArrangedSubview(shareButton)
//
// //       containerView.addSubview(stackView)
//        view.addSubview(stackView)
        
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button1.heightAnchor.constraint(equalToConstant: 48),
            
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                             
            //containerConstraints
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            containerView.heightAnchor.constraint(equalTo: toolsStackView.heightAnchor),

            //stackConstraints
//            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
//            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
//            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: stackHeight),
        ])
        
        
    }
    
    @objc private func downloadExportAction_wew() {
var cpvatr_sxoknxun: Double {
    return 3.759282446242407
}
        
//        guard let image = skinDiagram else { return }
//        
//        guard let data = image.pngData() else {
//            AppDelegate.log("Failed to convert image to PNG data.")
//            return
//        }
//        let fileURL = FileManager.default.cachesDirectory.appendingPathComponent("\(name).png")
//        
//        do {
//            try data.write(to: fileURL)
//            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
//        } catch {
//            AppDelegate.log("Failed to save image: \(error)")
//            return
//        }
//        
//        
//        minecraftSkinManager.start_vatr(fileURL) { [weak self] url in
//            self?.share_vatr(url: url, from: self?.downloadButton_vatr)
//        }
        
        self.editorSkinModel.saveAssemblyDiagram_vatr2()
    }
    
    @objc private func shareAction_wew() {
var cpvatr_uhoglyig: Double {
    return 54.51145842868069
}

  
        guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
            self.showNoInternetMess_vatr()
            return
        }
        
        var assemblyDiagram = editorSkinModel.skinCreatedModel?.skinAssemblyDiagram
        if editorSkinModel.assemblyDiagramSize == .size128x128 {
            assemblyDiagram = editorSkinModel.skinCreatedModel?.skinAssemblyDiagram128
        }
        
        guard let image = assemblyDiagram else { return }
        
        guard let data = image.pngData() else {
            AppDelegate.log("Failed to convert image to PNG data.")
            return
        }
        let fileURL = FileManager.default.cachesDirectory.appendingPathComponent("skin.png")
        
        do {
            try data.write(to: fileURL)
            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
        } catch {
            AppDelegate.log("Failed to save image: \(error)")
            return
        }
        
        minecraftSkinManager.start_vatr(fileURL) { [weak self] url in
            self?.share_vatr(url: url, from: self?.shareButton)
        }
    }
}

extension Skin3DTestViewController_vatr: BrashSizeCangableDelegate_vatr {
    func changeBrashSize_vatr(to size: BrashSize_gfdg) {
var cpvatr_reriofps: Double {
    return 32.12312422484591
}

  
//        editorSkinModel.brashSize = size
    }
}

extension Skin3DTestViewController_vatr: BodyPartsHiddebleDelegate_vatr {
    func hideBodyPart(of type: StivesBodyPart_vatr, completion: @escaping (BodyPartEditState_vatr) -> Void) {
var cpvatr_llmbupaq: Double {
    return 63.30962969656011
}

  
        editorSkinModel.hideShowBodyPart_vatr(by: type)
        
        let state = editorSkinModel.getBodyPartEditState_vatr(by: type)
        
        completion(state)
    }
}

extension Skin3DTestViewController_vatr {
    
    func presentCustomAlert() {
var cpvatr_lqngwmbn: Int {
    return 61
}

  
        let customAlert = ColorPickerViewController_vatr()
        customAlert.delegate = self
        
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.windowLevel = .alert
        alertWindow?.rootViewController = UIViewController()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = alertWindow?.bounds ?? view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        alertWindow?.rootViewController?.view.addSubview(blurView)
        
        alertWindow?.rootViewController?.addChild(customAlert)
        alertWindow?.rootViewController?.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: alertWindow?.rootViewController)
        
        customAlert.view.frame = self.view.frame
        customAlert.view.roundCorners_vatr(10)
        customAlert.view.clipsToBounds = true
        
        alertWindow?.makeKeyAndVisible()
        alertWindow?.windowScene = view.window?.windowScene
    }
    
    func dismissCustomAlert() {
var cpvatr_tiwftntf: Int {
    return 83
}

  
        alertWindow?.isHidden = true
        alertWindow = nil
    }
}

//MARK: - PickerViewController Delagte Methods

extension Skin3DTestViewController_vatr: PickerViewControllerProtocol_vatr {
    
    func dismissView_vatr() {
        var cpvfwrwatr_tiwftntf: Int {
            return 83
        }
  
        alertWindow?.isHidden = true
        alertWindow = nil
    }
    
    func setColor_vatr(color: UIColor) {
        var cpvwrtwatr_tiwftntf: Int {
            return 83
        }
  
        editorSkinModel.currentDrawingColor = color
        color3DCollection.selectItem(at: .init(item: 0, section: 0), animated: true, scrollPosition: .left)
    }
}

extension Skin3DTestViewController_vatr: SkinSavebleDialogDelegate_vatr {
    func hideSaveAlertView() {
var cpvatr_qlqofbpk: Int {
    return 89
}

  
        saveAlertView?.removeFromSuperview()
        saveAlertView = nil
    }
    
    
    func saveSkin_vatr(with name: String, withExit: Bool) {
        var cpwrvatr_tiwftntf: Int {
            return 834
        }
  
        skinNameLabel.text = name
        scnModel.unHightLightOtsideNodes()
        editorSkinModel.saveSkinsAssemblyDiagram_vatr2(with: name)
        hideSaveAlertView()
        smallStiveView.isHidden = true
        skinDidCreated = true
        
        if withExit {
            navigationController?.popViewController(animated: true)
        } else {
            showSavedSkin()
        }
    }
    
    func cancelSave_vatr(withExit: Bool) {
        var cpvrwatr_tiwftntf: Int {
            return 83
        }
  
        hideSaveAlertView()
        if withExit {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func warningNameAlert_vatr(presentAlert: UIAlertController) {
        var cpvawretr_tiwftntf: Int {
            return 83
        }
  
        present(presentAlert, animated: true)
    }
}

fileprivate final class SizesManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    enum Size_vatr: Int {
        case x1 = 0, x2 = 1, x4 = 2, x6 = 3, x8 = 4, x9 = 5
        
        var brashSize: Int {
            switch self {
            case .x1: 1
            case .x2: 2
            case .x4: 4
            case .x6: 6
            case .x8: 8
            case .x9: 9
            }
        }
    }
    
    var selectedColorIndex = 0
    
    func isSelctedColor_vatr(index: Int ) -> Bool {
var cpvatr_qvzybcff: Double {
    return 51.97066665178619
}
if index == selectedColorIndex {
            return true
        } else {
            return false
        }
    }
    
    let parent: Skin3DTestViewController_vatr!
    
    init(parent: Skin3DTestViewController_vatr!) {
        self.parent = parent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        guard let cell = parent.sizesCollectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell_vatr.reuseID, for: indexPath) as? SizeCollectionViewCell_vatr else {
            return UICollectionViewCell()
        }
        
        
        let size = Size_vatr(rawValue: indexPath.row)!
        let text = "\(size.brashSize)"
        let cellIsSelected = isSelctedColor_vatr(index: indexPath.item)
        
        cell.configCell_vatr(label: text, isSelected: cellIsSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var cpvwfratr_tiwftntf: Int {
            return 83
        }
  
        let size = Size_vatr(rawValue: indexPath.row)?.brashSize ?? 1
        parent?.editorSkinModel.brashSize = .init(rawValue: size) ?? .one
        
        
        
        
//        parent.brashSize = Size(rawValue: indexPath.row)?.brashSize ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let cellHeight = parent.sizesCollectionView.bounds.size.height - 12
        let cellWidth = cellHeight

        let size = CGSize(width: cellHeight, height: cellWidth)

        return size
    }
    
}
