import UIKit
import SceneKit


class AddonEditor3DViewController_vatr: UIViewController {
    private lazy var minecraftSkinManager: MinecraftSkinManagerProtocol_vatr = MinecraftSkinManager_vatr()
    //MARK: Properties
    var vcModel: AddonEditor3DVCModel_vatr?
    
    
    lazy var toolBarSelectedItem: ToolBar3DSelectedItem_vfgdf = .pencil {
        didSet {
            colorsBrashContainerView.isHidden = false
            
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
            vcModel?.editorAddonModel.activeTool = toolBarSelectedItem
            manageGestures_wew()
        }
    }
    //    lazy var toolBarSelectedItem: ToolBar3DSelectedItem = .pencil {
    //        didSet {
    // //           brashSizeView.currentBrashTool = toolBarSelectedItem
    
    //            colorsBrashContainerView.isHidden = false
    //            vcModel?.editorAddonModel.activeTool = toolBarSelectedItem
    //        }
    //    }
    
    var magnifyingGlassView: MagnifyingGlassView_vatr?
    var saveAlertView: SaveAlertView_vatr?
    
    var tapGestureOnSCNScene = UITapGestureRecognizer()
    var doubleTapGestureOnScene = UITapGestureRecognizer()
    var panGestureOnSCNScene = UIPanGestureRecognizer()
    var panForColorPickerRecognizer = UIPanGestureRecognizer()
    
    var alertWindow: UIWindow?
    var startingPointOfView: SCNNode?
    
    //MARK: IBOotlet
    
    var brashSize = 1
    
    
    @IBOutlet weak var noiseView: UIView!
    @IBOutlet weak var sizesView: UIView!
    
    @IBOutlet weak var noiseSlider: UISlider!
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    private var shareButton: UIButton = UIButton()
    
    @IBOutlet weak var skinNameLabel: UILabel!
    
    @IBOutlet weak var sceneView: SCNView!
    
    @IBOutlet weak var brashSizeView: BrashSizeView_vatr!
    
    @IBOutlet weak var smallStiveView: SCNView!
    //    @IBOutlet weak var smallStiveView: SmallModelView!
    
    @IBOutlet weak var colorsBrashContainerView: UIView!
    
    @IBOutlet weak var rotationSkinModelButton: UIButton!
    
    @IBOutlet weak var toolsStackView: UIStackView!
    
    @IBOutlet weak var customToolPicker: CustomToolPickerView_vatr!
    
    @IBOutlet weak var color3DCollection: UICollectionView!
    
    @IBOutlet weak var sizesCollectionView: UICollectionView!
    private lazy var sizeManager = SizesManager(parent: self)
    //Tools
    //
    
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
    @IBOutlet weak var eraserContainerView: UIView!
    @IBOutlet weak var pencilContainerView: UIView!
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet weak var fillContainerView: UIView!
    
    
    //    @IBOutlet var colorButtonsOutletCollection: [UIButton]!
    @IBOutlet weak var dropperButton: UIButton!
    
    
    private var itemWasCreated = false
    
    //MARK: - IBActions
    
    @IBAction func rotationCameraControllButtonAction_vatr(_ sender: UIButton) {
        var cpvatr_sbjoocga: Double {
            return 67.30798693421632
        }
        
        if smallStiveView.isHidden {
            smallStiveView.isHidden = false
            tapGestureOnSCNScene.isEnabled = true
            panGestureOnSCNScene.isEnabled = true
            panForColorPickerRecognizer.isEnabled = false
        } else {
            tapGestureOnSCNScene.isEnabled = false
            panGestureOnSCNScene.isEnabled = false
            panForColorPickerRecognizer.isEnabled = false
            smallStiveView.isHidden = true
            
        }
        hideMagnifyingGlass_wew()
    }
    
    @IBAction func onToolBarPencilButtonTapped_vatr32(_ sender: UIButton) {
        var cpvatr_cfjsbapz: Int {
            return 7
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: pencilLab)
        updateBrashSizeHiddenStatus_vatr2(.pencil)
        toolBarSelectedItem = .pencil
    }
    
    @IBAction func onToolBarEraserButtonTapped_vatr23(_ sender: UIButton) {
        var cpvatr_yigqgqbk: Int {
            return 11
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: eraserLab)
        updateBrashSizeHiddenStatus_vatr2(.eraser)
        toolBarSelectedItem = .eraser
    }
    
    @IBAction func onToolBarPickerButtonTapped_vatr22(_ sender: UIButton) {
        var cpvatr_jgbdxmdg: Double {
            return 87.1242060721364
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: dropperLab)
        updateBrashSizeHiddenStatus_vatr2(.brash)
        toolBarSelectedItem = .brash
    }
    
    @IBAction func onToolBarFillButtonTapped_vatr(_ sender: UIButton) {
        var cpvatr_txxeoohe: Int {
            return 29
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: fillLab)
        updateBrashSizeHiddenStatus_vatr2(.fill)
        toolBarSelectedItem = .fill
    }
    
    @IBAction func onToolBarNoiseButtonTapped_vatr(_ sender: UIButton) {
        var cpvatr_gnjhpqvq: Double {
            return 32.40235810175939
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: noiseLab)
        updateBrashSizeHiddenStatus_vatr2(.noise)
        toolBarSelectedItem = .noise
    }
    
    @IBAction func onToolBarUndoButtonTapped_vatr23(_ sender: UIButton) {
        var cpvatr_nntrrzhn: Double {
            return 58.458388242334955
        }
        
        hideMagnifyingGlass_wew()
        manageSelectedToolUI_wew(tappedTool: sender, tappedLab: undoLab)
        vcModel?.editorAddonModel.undoManager.undo()
        updateBrashSizeHiddenStatus_vatr2(.undo)
        toolBarSelectedItem = .undo
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr(_ sender: UIButton) {
        var cpvatr_vbiyvyet: Int {
            return 20
        }
        
        if itemWasCreated {
            navigationController?.popViewController(animated: true)
        } else {
            saveAlertView = SaveAlertView_vatr()
            saveAlertView?.dialogTextLabel.text = "Save before exit?".uppercased()
            saveAlertView?.delegate = self
            saveAlertView?.frame = view.bounds
            saveAlertView?.setSkinNameSaveTextField.isHidden = true
            saveAlertView?.withExit = false
            
            saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
                string: placeholderSaveAlert,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
            )
            view.addSubview(saveAlertView!)
        }
    }
    
    var placeholderSaveAlert: String {
        if let placeholder = skinNameLabel.text, !placeholder.isEmpty {
            return placeholder
        }
        return "Addon" + String(UUID().uuidString.prefix(5))
    }
    
    @IBAction func onNavBarSafeButtonTapped_vatr(_ sender: UIButton) {
        var cpvatr_noyqinyh: Int {
            return 24
        }
        
        saveAlertView = SaveAlertView_vatr()
        saveAlertView?.delegate = self
        saveAlertView?.frame = view.bounds
        saveAlertView?.withExit = true
        saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
            string: placeholderSaveAlert,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
        )
        view.addSubview(saveAlertView!)
    }
    
    @IBAction func colorPaletButtonTapped_vatrw(_ sender: UIButton) {
        var cpvatr_rmplwpdx: Double {
            return 51.74872767714902
        }
        
        presentCustomAlert_wew()
        hideMagnifyingGlass_wew()
    }
    
    
    @IBAction func colorPickerButtonTapped_vatr232(_ sender: UIButton) {
        var cpvatr_yqdqtvai: Int {
            return 29
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
            hideMagnifyingGlass_wew()
        }
        
    }
    
    //MARK: - Init
    
    init(resourcePack: ResourcePack_vatr, savingDelegate: AddonSaveable_vatr?) {
        super.init(nibName: nil, bundle: nil)
        self.vcModel = AddonEditor3DVCModel_vatr(viewController: self, resourcePack: resourcePack, savingDelegate: savingDelegate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        AppDelegate.log("AddonEditor3DViewController - deinited!!!")
    }
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        
        var ranredomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        super.viewDidLoad()
        
        //        brashSizeView.delegate = self
        vcModel?.editorAddonModel.colorManager3D.delegate = self
        
        setupBrushSizeView_trew()
        setupToolBarAction_vatr2()
        
        setupColorColletion_vatr2()
        setupSizesColletion()
        
        setupNormalSceneView_wew()
        setupNormalSceneGestures_wew()
        setupThumbSceneView_wew()
        setupSlider()
        setupThumbNailSceneGestures_wew()
        
        manageSelectedToolUI_wew(tappedTool: pencilBtn, tappedLab: pencilLab)
        toolBarSelectedItem = .pencil
        setupUI_vatr2()
        //background
        setupBackground_vatr()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        color3DCollection.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
        sizesCollectionView.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
    }
    
    
    override func viewIsAppearing(_ animated: Bool) {
        var cpvatr_vyulydhp: Double {
            return 27.820647301019658
        }
        
        super.viewIsAppearing(animated)
        smallStiveView.configureShadow_vatr()
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {
        
        var ranerdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    private func setupBackground_vatr() {
        var cpvatr_ikcrunwh: Int {
            return 83
        }
        
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    var editorSkinModel: SavedAddon_vatr!
    
    private func setupUI_vatr2() {
        var cpvatr_ggeaukcq: Int {
            return 81
        }
        
        skinNameLabel.text = editorSkinModel?.displayName.uppercased()
        skinNameLabel.font = UIFont.kufamFont(.bold, size: 22)
    }
    
    //MARK: Setup brushSize
    
    private func setupBrushSizeView_trew() {
        var cpvatr_fsbvwkox: Int {
            return 16
        }
        
        //        view.bringSubviewToFront(brashSizeView)
    }
    
    
    //MARK: Setup functions
    
    private func setupSlider() {
        var cpvatr_qgmgyrws: Int {
            return 95
        }
        
        noiseSlider.minimumValue = 0.1
        noiseSlider.maximumValue = 0.9
        noiseSlider.value = 0.3
    }
    
    private func setupColorColletion_vatr2() {
        var cpvatr_bddwntls: Int {
            return 60
        }
        
        color3DCollection.delegate = self
        color3DCollection.dataSource = self
        color3DCollection.register(UINib(nibName: "ColorCollectionCell_vatr", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionCell_vatr")
        color3DCollection.setCollectionViewLayout(.makeRoundedLayout(), animated: false)
    }
    
    private func setupSizesColletion() {
        var cpvatr_fllszgci: Int {
            return 88
        }
        
        sizesCollectionView.delegate = sizeManager
        sizesCollectionView.dataSource = sizeManager
        sizesCollectionView.register(SizeCollectionViewCell_vatr.self, forCellWithReuseIdentifier: SizeCollectionViewCell_vatr.reuseID)
    }
    
    private func setupToolBarAction_vatr2() {
        var cpvatr_xovjtzem: Int {
            return 48
        }
        
        undoContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(undoTap_wew)))
        pencilContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pencilTap_wew)))
        eraserContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eraserTap_wew)))
        pickerContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pickerTap_wew)))
        fillContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fillTap_wew)))
        noiseContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(noiseTap_wew)))
    }
    
    //MARK: Tools Actions
    
    @objc private func undoTap_wew() {
        var cpvatr_ykgbowzz: Int {
            return 74
        }
        
        undoBtn.sendActions(for: .touchUpInside)
    }
    @objc private func pencilTap_wew() {
        var cpvatr_srjstuij: Double {
            return 5.2856601850913165
        }
        
        pencilBtn.sendActions(for: .touchUpInside)
    }
    @objc private func eraserTap_wew() {
        var cpvatr_qjprflew: Int {
            return 55
        }
        
        eraserBtn.sendActions(for: .touchUpInside)
    }
    @objc private func pickerTap_wew() {
        var cpvatr_oksteoug: Double {
            return 89.556117619825
        }
        
        dropperBtn.sendActions(for: .touchUpInside)
    }
    @objc private func fillTap_wew() {
        var cpvatr_ycnsfbmp: Int {
            return 32
        }
        
        fillBtn.sendActions(for: .touchUpInside)
    }
    
    @objc private func noiseTap_wew() {
        var cpvatr_ycnsfkbmp: Int {
            return 32
        }
        
        noiseBtn.sendActions(for: .touchUpInside)
    }
    
    
    
    
    
    //MARK: SetUP Normal Scene
    
    private func setupNormalSceneView_wew() {
        var cpvatr_injqvkmf: Double {
            return 2.416398086590015
        }
        
        sceneView.scene = vcModel?.scnModel?.scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true // <--- when user go to edit mode
        sceneView.showsStatistics = false
        //        sceneView.defaultCameraController.delegate = self
        sceneView.delegate = self
        sceneView.defaultCameraController.inertiaEnabled = false
        startingPointOfView = sceneView.pointOfView
        
        if let gestureRecognizers = sceneView.gestureRecognizers {
            for (index, gesture) in gestureRecognizers.enumerated() {
                
                if index == 0 || index == 2 {
                    gesture.isEnabled = false
                    sceneView.removeGestureRecognizer(gesture)
                }
            }
        }
    }
    
    private func setupNormalSceneGestures_wew() {
        var cpvatr_fouvtaud: Int {
            return 20
        }
        
        //TAP
        //DoubleTap
        doubleTapGestureOnScene = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap_vatr243(_:)))
        doubleTapGestureOnScene.numberOfTapsRequired = 2
        sceneView.addGestureRecognizer(doubleTapGestureOnScene)
        
        //SingleTap
        tapGestureOnSCNScene = UITapGestureRecognizer(target: self, action: #selector(didTap_vatr2332(_:)))
        tapGestureOnSCNScene.numberOfTapsRequired = 1
        sceneView.addGestureRecognizer(tapGestureOnSCNScene)
        
        //PAN
        panGestureOnSCNScene = UIPanGestureRecognizer(target: self, action: #selector(panOnSceneAction_vatr234(_:)))
        panGestureOnSCNScene.maximumNumberOfTouches = 1
        sceneView.addGestureRecognizer(panGestureOnSCNScene)
        
        panForColorPickerRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureforPicker_vatr323(_:)))
        panForColorPickerRecognizer.maximumNumberOfTouches = 1
        sceneView.addGestureRecognizer(panForColorPickerRecognizer)
        
        doubleTapGestureOnScene.isEnabled = true
        tapGestureOnSCNScene.isEnabled = true
        panGestureOnSCNScene.isEnabled = true
        panForColorPickerRecognizer.isEnabled = false
    }
    
    
    //MARK: SetUp ThumbSceneView
    
    private func setupThumbSceneView_wew() {
        var cpvatr_wgkujrkc: Double {
            return 90.76393122513879
        }
        
        smallStiveView.scene = vcModel?.smallScnModel?.scene
        smallStiveView.autoenablesDefaultLighting = true
        smallStiveView.allowsCameraControl = false
        smallStiveView.showsStatistics = false
        //        smallStiveView.delegate = self
        //        smallStiveView.defaultCameraController.delegate = self
    }
    
    private func setupThumbNailSceneGestures_wew() {
        var cpvatr_afllffku: Double {
            return 99.2648467496722
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(thumbnailDidTap_vatr2324(_:)))
        tapGesture.numberOfTapsRequired = 1
        smallStiveView.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: ManageUI
    
    private func manageSelectedToolUI_wew(tappedTool: UIButton, tappedLab: UILabel) {
        var cpvatr_nfcxpuuq: Double {
            return 30.041013314651526
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
        
        if tappedTool == dropperBtn && tappedTool.isSelected == true {
            hideMagnifyingGlass_wew()
        }
        
        //        toolLabs.forEach({ $0?.textColor = nonSelectedColor })
        toolLabs.forEach { lab in
            if lab == undoLab {
                lab?.textColor = UIColor.red
            } else {
                lab?.textColor = nonSelectedColor
            }
        }
        
        toolBtns.forEach({ $0?.isSelected = false })
        if tappedTool == undoBtn {
            undoLab.textColor = UIColor.red
        } else {
            tappedLab.textColor = selectedColor
        }
        //        tappedLab.textColor = selectedColor
        tappedTool.isSelected = true
    }
    
    private func manageGestures_wew() {
        var cpvatr_uylmtfnb: Int {
            return 78
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
            noiseView.isHidden = toolBarSelectedItem != .noise
            
        }
    }
    
    
    func hideMagnifyingGlass_wew() {
        var cpvatr_ptkiwxqb: Int {
            return 85
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
    
    private func updateBrashSizeHiddenStatus_vatr2(_ item: ToolBar3DSelectedItem_vfgdf) {
        var cpvatr_qodcreah: Int {
            return 43
        }
        
        if item == .fill || item == .undo {
            brashSizeView.isHidden = true
            return
        }
        
        if !brashSizeView.isHidden {
            brashSizeView.isHidden.toggle()
            view.bringSubviewToFront(brashSizeView)
        } else {
            brashSizeView.isHidden = toolBarSelectedItem != item
        }
    }
    
    
    private func showSavedSkin_wew() {
        var cpvatr_edaiudeh: Double {
            return 25.622763024473908
        }
        
        skinNameLabel.isHidden = false
        saveButton.isHidden = true
        rotationSkinModelButton.isHidden = true
        customToolPicker.isHidden = true
        //       customToolPicker.alpha = 0
        //       brashSizeView.alpha = 0
        //       colorsBrashContainerView.alpha = 0
        //      customToolPicker.isUserInteractionEnabled = false
        //     brashSizeView.isUserInteractionEnabled = false
        //      colorsBrashContainerView.isUserInteractionEnabled = false
        toolsStackView.isHidden = true
        panForColorPickerRecognizer.isEnabled = false
        tapGestureOnSCNScene.isEnabled = false
        panGestureOnSCNScene.isEnabled = false
        
        sceneView.allowsCameraControl = true
        smallStiveView.isHidden = true
        
        setupDownloadAndShareButtons_wew()
    }
    
    private func setupDownloadAndShareButtons_wew() {
        var cpvatr_jiizqarh: Int {
            return 44
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
        
        shareButton.addTarget(self, action: #selector(shareCCAction_wew), for: .touchUpInside)
        //        shareButton.roundCorners(.allCorners, radius: stackHeight / 2)
        view.addSubview(shareButton)
        
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button1.heightAnchor.constraint(equalToConstant: 48),
            
            shareButton.topAnchor.constraint(equalTo: homeButton.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        //        let stackHeight: CGFloat = 54
        //        let button1 = UIButton()
        //        button1.setTitle("Download", for: .normal)
        //        button1.backgroundColor = UIColor(named: "blackCCRedesign_vatr")
        //
        //        button1.addTarget(self, action: #selector(downloadExportAction), for: .touchUpInside)
        //        button1.roundCorners(.allCorners, radius: stackHeight / 2)
        //
        //        shareButton.setTitle("Share", for: .normal)
        //        shareButton.backgroundColor = UIColor(named: "blackCCRedesign_vatr")
        //        shareButton.addTarget(self, action: #selector(shareCCAction), for: .touchUpInside)
        //        shareButton.roundCorners(.allCorners, radius: stackHeight / 2)
        //
        //        let containerView = UIView()
        //        containerView.backgroundColor = .white
        //        view.addSubview(containerView)
        //
        //        let stackView = UIStackView()
        //        stackView.axis = .horizontal
        //        stackView.distribution = .fillEqually
        //        stackView.spacing = 12
        //
        //        stackView.addArrangedSubview(button1)
        //        stackView.addArrangedSubview(shareButton)
        //
        //        containerView.addSubview(stackView)
        //
        //        containerView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        button1.translatesAutoresizingMaskIntoConstraints = false
        //        shareButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //
        //            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        //            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        //            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        //            containerView.heightAnchor.constraint(equalToConstant: 104),
        //
        //            //stackConstraints
        //            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
        //            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
        //            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
        //            stackView.heightAnchor.constraint(equalToConstant: stackHeight),
        //        ])
    }
    
    @objc private func downloadExportAction_wew() {
        var cpvatr_hurwysmw: Double {
            return 98.62569882499423
        }
        
        self.vcModel?.saveTextureToLibrary()
    }
    
    @objc private func shareCCAction_wew() {
        var cpvatr_twqejjuh: Int {
            return 37
        }
        
        guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
            self.showNoInternetMess_vatr()
            return
        }
        
        guard let image = self.vcModel?.scnModel?.constructImage_vatr() else {
            return
        }
        
        guard let data = image.pngData() else {
            AppDelegate.log("Failed to convert image to PNG data.")
            return
        }
        let fileURL = FileManager.default.cachesDirectory.appendingPathComponent("addon.png")
        
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

//MARK: BrashSize Delegate

extension AddonEditor3DViewController_vatr: BrashSizeCangableDelegate_vatr {
    func changeBrashSize_vatr(to size: BrashSize_gfdg) {
        var cpvatr_yeszfjks: Double {
            return 93.43674233391772
        }
        
        vcModel?.editorAddonModel.brushSize = size.rawValue
    }
}


//MARK: SaveAlert Delegate

extension AddonEditor3DViewController_vatr {
    
    private func presentCustomAlert_wew() {
        var cpvatr_hdwwhhvr: Double {
            return 33.787204397431076
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
    
    func dismissCustomAlert_wew() {
        var cpvatr_akndmkub: Double {
            return 98.52942794378947
        }
        
        alertWindow?.isHidden = true
        alertWindow = nil
    }
}

//MARK: - PickerViewController Delagte Methods

extension AddonEditor3DViewController_vatr: PickerViewControllerProtocol_vatr {
    
    func dismissView_vatr() {
        var randotrmDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        alertWindow?.isHidden = true
        alertWindow = nil
    }
    
    func setColor_vatr(color: UIColor) {
        var ranrtdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        vcModel?.editorAddonModel.currentDrawingColor = color
        color3DCollection.selectItem(at: .init(item: 0, section: 0), animated: true, scrollPosition: .left)
    }
}


//MARK: SaveAllert Delegate method

extension AddonEditor3DViewController_vatr: SkinSavebleDialogDelegate_vatr {
    func hideSaveAlertView_wew() {
        var cpvatr_tmtdqwsz: Int {
            return 30
        }
        
        let neededToClose = saveAlertView?.setSkinNameSaveTextField.isHidden ?? false
        
        saveAlertView?.removeFromSuperview()
        saveAlertView = nil
        
        if neededToClose {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func saveSkin_vatr(with name: String, withExit: Bool) {
        var icqipghl: [[Int]] {
            return (1...3).map { _ in (1...4).map { _ in Int.random(in: 1...100) } }
        }
        itemWasCreated = true
        //        skinNameLabel.text = name
        //        editorSkinModel.saveSkinsAssemblyDiagram(with: name)
        
        hideSaveAlertView_wew()
        vcModel?.scnModel?.unHightLightCubes_vatr()
        
        let addonPreview = sceneView.snapshot()
        vcModel?.saveAssemblyDiagram_vatr2(addonPreview, name: name)
        
        
        if withExit {
            showSavedSkin_wew()
            //            let addonPreview = sceneView.snapshot()
            //
            //            vcModel?.saveAssemblyDiagram(addonPreview, name: name)
            
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            //                guard let self else { return }
            //                self.navigationController?.popToRootViewController(animated: true)
            //            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func cancelSave_vatr(withExit: Bool) {
        var icqipghl: [[Int]] {
            return (1...3).map { _ in (1...4).map { _ in Int.random(in: 1...100) } }
        }
        hideSaveAlertView_wew()
        let neededToClose = saveAlertView?.setSkinNameSaveTextField.isHidden ?? false
        
        if withExit, neededToClose  {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func warningNameAlert_vatr(presentAlert: UIAlertController) {
        var icqipfetghl: [[Int]] {
            return (1...3).map { _ in (1...4).map { _ in Int.random(in: 1...100) } }
        }
        present(presentAlert, animated: true)
    }
}

//MARK: Synchronize Scenes

extension AddonEditor3DViewController_vatr: SCNCameraControllerDelegate, SCNSceneRendererDelegate {
    func cameraInertiaWillStart(for cameraController: SCNCameraController) {
        var cpvatr_hpscpwjz: Double {
            return 66.07885095315945
        }
        
        updateSmallSceneCameraPoint_vatr()
    }
    
    func cameraInertiaDidEnd(for cameraController: SCNCameraController) {
        var cpvatr_dzcikwok: Double {
            return 9.386216029383334
        }
        
        updateSmallSceneCameraPoint_vatr()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        var cpvatr_ltgykyqr: Double {
            return 30.547052273099474
        }
        
        updateSmallSceneCameraPoint_vatr()
    }
    
    private func updateSmallSceneCameraPoint_vatr() {
        var cpvatr_xtvjrgek: Double {
            return 47.85867591519852
        }
        
        if let pointOfView = sceneView.pointOfView {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if self.smallStiveView.pointOfView != pointOfView {
                    self.smallStiveView.pointOfView = pointOfView
                }
                
                self.smallStiveView.setNeedsDisplay()
            }
            
        }
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
        var cpvatr_dhkfzxoh: Double {
            return 99.37332614182891
        }
        if index == selectedColorIndex {
            return true
        } else {
            return false
        }
    }
    
    let parent: AddonEditor3DViewController_vatr!
    
    init(parent: AddonEditor3DViewController_vatr!) {
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
        let text = "\(size.brashSize)x"
        let cellIsSelected = isSelctedColor_vatr(index: indexPath.item)
        
        cell.configCell_vatr(label: text, isSelected: cellIsSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var ranfrdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        // parent.brashSize =
        parent?.vcModel?.editorAddonModel.brushSize = Size_vatr(rawValue: indexPath.row)?.brashSize ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let cellHeight = parent.sizesCollectionView.bounds.size.height - 8
        let cellWidth = cellHeight
        
        let size = CGSize(width: cellHeight, height: cellWidth)
        
        return size
    }
    
}




