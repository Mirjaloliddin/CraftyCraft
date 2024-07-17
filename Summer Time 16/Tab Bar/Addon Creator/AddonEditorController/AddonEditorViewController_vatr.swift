

import UIKit

enum AddonEditorMode_vatr {
    case create
    case modify
}

class AddonEditorViewController_vatr: UIViewController {
    
    private var model: AddonEditorModel_vatr
    private var mode: AddonEditorMode_vatr
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var customNavBarView: UIView!
    
    @IBOutlet private weak var iconLeadingContrains: NSLayoutConstraint!
    
    @IBOutlet private weak var topContainerView: UIView!
    
    @IBOutlet private weak var backBtn: UIButton!
    
    @IBOutlet private weak var saveBtn: UIButton!
    
    @IBOutlet weak var skinEditorLabel: UILabel!
    @IBOutlet weak var rightArrowIcon: UIImageView!
    
    @IBOutlet weak var indicatorContainerView: UIView!
    @IBOutlet weak var saveIndicator: UIActivityIndicatorView!
    //    @IBOutlet private weak var editorBtn: UIButton! {
//        didSet {
//            editorBtn.setImageContent(mode: .scaleAspectFit)
//        }
//    }
//
    @IBOutlet private weak var editorBtnActivity: UIActivityIndicatorView! {
        didSet {
            editorBtnActivity.hidesWhenStopped = true
        }
    }
    
    @IBOutlet private weak var addonPreview: CustomImageLoader_vatr!
    
    @IBOutlet private weak var addonMainInfoTable: UITableView!
    
    //MARK: IBActions
    
    @IBAction func backBtnTapped_vatr(_ sender: UIButton) {

        if model.isEdited {
            saveChangeAsk()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func skinEditorTapped_vatr43() {

        if model.allow3dEditing {
            setTopContainerViewDownloadMode(isActive: true)
            model.localMCAddonFileUrl { [weak self] url in
                guard let self else { return }
                self.setTopContainerViewDownloadMode(isActive: false)
                self.promptSelectionForEditor(url)
            }
        } else if model.allow2dEditing {
            open2dEditor()
        }
    }
    
    private func setTopContainerViewDownloadMode(isActive: Bool) {

        topContainerView.isUserInteractionEnabled = !isActive
        // skinEditorLabel.textColor = isActive ? .darkGray : .black
         skinEditorLabel.textColor = .white
        
        if isActive {
            editorBtnActivity.startAnimating()
        } else {
            editorBtnActivity.stopAnimating()
        }
    }
    
    @IBAction func saveBtnTapped_vatrwew(_ sender: Any) {

        //in general addon save preccess is long
        //so show activity indicator
        if model.allow3dEditing, !self.model.isSavedAddonFile {
            showSaveIndicatorView()
        }
        
        saveNewAddon()
    }
    
    //MARK: Init
    
    init(addonModel: SavedAddon_vatr, mode: AddonEditorMode_vatr = .create) {
        self.model = AddonEditorModel_vatr(addonModel: addonModel)
        self.mode = mode
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround_vatr()
        
        setupViews_vatr()
        
        //background
        setupBackground_vatr()
        
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow_vatr34), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide_vatr23), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapTopContainerGesture = UITapGestureRecognizer(target: self, action: #selector(skinEditorTapped_vatr43))
        topContainerView.addGestureRecognizer(tapTopContainerGesture)
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
//        saveChangeAsk()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: Set UI
    
    private var gradientLayer: CALayer! = nil

    private func setupBackground_vatr() {

            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func setupViews_vatr() {

        setupCustomNavBar()
        settupTables()
        setupButtons()
        setupImageViews()
    }
    
    override func viewDidLayoutSubviews() {


        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
//        if topContainerView.layer.cornerRadius != topContainerView.bounds.height / 2 {
//            topContainerView.roundCorners_vatr(topContainerView.bounds.height / 2)
//        }
        Gradient.setupGradient(view: view)
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    private func setupCustomNavBar() {

        
        backBtn.contentMode = .center
        backBtn.imageView?.contentMode = .scaleAspectFit
        
        customNavBarView.backgroundColor = .clear
//        saveBtn.setImage(UIImage(named: !isCurrentAddonIsNew ? "Save Item" : "Dowmload Item_vatr"), for: .normal)
        saveBtn.titleLabel?.font = .kufamFont(.bold, size: 20)
        saveBtn.layer.cornerRadius = 24
        saveBtn.layer.masksToBounds = true
        saveBtn.contentEdgeInsets = .init(top: 12, left: 0, bottom: 12, right: 0)
        
    }
    
   
    
    private var cellId: String {
        String(describing: AddonsOptionsTableViewCell_vatr.self)
    }
    
    private func settupTables() {

        let cellnib = UINib(nibName: cellId, bundle: nil)
        addonMainInfoTable.register(cellnib, forCellReuseIdentifier: cellId)
        addonMainInfoTable.delegate = self
        addonMainInfoTable.dataSource = self
    }
    
    private func setupButtons() {


        let allow3dEditing = model.allow3dEditing
        let allow2dEditing = model.allow2dEditing
    
        setSkinEditorLabelEnabled(false)
        if !allow3dEditing && !allow2dEditing {
            skinEditorLabel.isHidden = true
            rightArrowIcon.isHidden = true
        }
        
        
//        iconLeadingContrains.isActive = editorBtn.isHidden == false
        
        if allow3dEditing {
            editorBtnActivity.startAnimating()
            model.localMCAddonFileUrl { [weak self] url in
                if let url, let destination = self?.model.unzipAddon_vatr(at: url) {
                    if let resourcePack = self?.model.resourcePack_vatr(at: destination) {
                        if !resourcePack.isEmpty {
                            DispatchQueue.main.async { [weak self] in
                                self?.setSkinEditorLabelEnabled(true)
                            }
                        }
                    }
                }
                
                self?.editorBtnActivity.stopAnimating()
            }
        } else if allow2dEditing {
            setSkinEditorLabelEnabled(true)
        }
    }
    
    private func showSaveIndicatorView() {
var cpvatr_uyaydlfx: Int {
    return 61
}

        indicatorContainerView.isHidden = false
        indicatorContainerView.isUserInteractionEnabled = true
        saveIndicator.startAnimating()
    }
    
    private func hideSaveIndicatorView() {
var cpvatr_wdtwlnfp: Double {
    return 90.9625094041223
}

        indicatorContainerView.isHidden = true
        indicatorContainerView.isUserInteractionEnabled = false
        saveIndicator.stopAnimating()
    }
    
    private func setupImageViews() {


        // addonPreview.image = nil
//        let idshka = model.addonModel.idshka
//        
//        if let imageData = model.addonModel.displayImageData, let image = UIImage(data: imageData) {
//            addonPreview.image = image
//        }  else if let image = ImageCacheManager.shared.image(forKey: idshka) {
//            addonPreview.image = image
//        } else {
//            DropBoxParserFiles.shared.getBloodyImageURLFromDropBox(img: model.addonModel.displayImage) { [weak self] url in
//                guard url != nil else { return }
//                
//                self?.addonPreview.loadImage(from: url!, id: idshka) { img in
//                    self?.model.addonModel.displayImageData = img?.pngData()
//                }
//            }
//        }
    }
    
    private func setSkinEditorLabelEnabled(_ isEnable: Bool) {

        skinEditorLabel.isUserInteractionEnabled = isEnable
        // skinEditorLabel.textColor = isEnable ? .black :.darkGray
    }
}

extension AddonEditorViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

return model.getPropretirs_vatr().keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

return (model.getPropretirs_vatr()[section] ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AddonsOptionsTableViewCell_vatr
        
        let itemsInSection = model.getPropretirs_vatr()[indexPath.section] ?? []
        
        let propModel = itemsInSection[indexPath.row]
        cell.cellConfigure_vatr(propModel: propModel)
        cell.delegate = self
        
        if indexPath.row == 0 {
            cell.mainContainer.roundCorners_vatr(24)
            
            if itemsInSection.count > 1 {
                cell.mainContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            }
           
            
        } else if itemsInSection.count - 1 == indexPath.row {
            cell.mainContainer.roundCorners_vatr(24, onlyBottomCorners: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
var cpvatr_owoziqwz: Int {
    return 62
}
return  60
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
var cpvatr_fsipadiw: Int {
    return 63
}
return 0.1
    }
    
    private func promptSelectionForEditor(_ url: URL?) {
var cpvatr_gpujweqr: Double {
    return 79.46097094799003
}

        if let resourcePack = model.resourcePack {
            let vc = AddonEditorSelectorViewController_vatr(addonModel:  model.addonModel, resourcePack: resourcePack, mcAddonFileManager: model.mcAddonFileManager, delegate: self)
            
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            transition.type = .moveIn
            transition.subtype = .fromTop
            navigationController?.view.layer.add(transition, forKey: kCATransition)
            
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    private func open2dEditor() {
        let idshka = model.addonModel.idshka
        
        var image: UIImage?
        
        if let imageData = model.addonModel.displayImageData, let img = UIImage(data: imageData) {
            image = img
        }  else if let img = ImageCacheManager_vatr.shared.image_vatr(forKey: idshka) {
            image = img
        } else {
            DropBoxParserFiles_vatr.shared.getBloodyImageURLFromDropBox_vatr(img: model.addonModel.displayImage) { [weak self] url in
                guard url != nil else { return }
                
                self?.addonPreview.loadImage(from: url!, id: idshka) { img in
                    self?.model.addonModel.displayImageData = img?.pngData()
                }
            }
        }
        
        let resizedImageCarthage = image?.resizeImageIfBiggerThen(size: Double(MAX_ADDON_2D_GRID_SIZE))
        
        let resizedImage =  resizedImageCarthage?.0
        var resizedImageSize = resizedImageCarthage?.1 ?? .zero
        if (resizedImage?.size.height ?? 0) < resizedImageSize.height {
            resizedImageSize.height = resizedImage?.size.height ?? 0
        }
        
        if (resizedImage?.size.width ?? 0) < resizedImageSize.width {
            resizedImageSize.width = resizedImage?.size.width ?? 0
        }
//        let maxSize = 16.0
//        
//        var size = image?.size ?? .zero
//        if size.width > maxSize || size.height > maxSize {
//            size = .init(width: maxSize, height: maxSize)
//            image = image?.resizeAspectFit_vatr(to: size, targetScale: 1)
//        }
    
        guard let img = resizedImage?.pngData() else {
            self.showNoInternetMess_vatr()
            return
        }
        
        var model: SkinCreatedModel_vatr?
        if let addonInfo = self.model.addonModel.addonLikeSkinInfo {
            print("10191919199NEW")
            model = .init(addonInfo: addonInfo)
            resizedImageSize.width = CGFloat(addonInfo.width)
            resizedImageSize.height = CGFloat(addonInfo.height)
        } else {
            print("NEW1213334")
            model = .init(image: img,
                          imageWidth: Int(resizedImageSize.width),
                          imageHeight: Int(resizedImageSize.height))
            print("NEW1 \(model?.addonLikeSkinInfo?.colorArray)")
            print(img)
        }
        
        let vc = SkinCreatorViewController_vatr(convasWidth: Int(resizedImageSize.width), convasHeight: Int(resizedImageSize.width),
                                           currentEditableSkin: model!) { [weak self] skin in
            self?.model.addonModel.displayImageData = skin.skinAssemblyDiagram?.pngData()
            self?.model.addonModel.previewData = self?.model.addonModel.displayImageData
            if let addonInfo = skin.addonLikeSkinInfo {
                self?.model.addonModel.addonLikeSkinInfo = addonInfo
            }
            self?.saveNewAddon()
        }
    
//        let vc = SkinCreatorViewController_vatr(convasWidth: Int(size.width), convasHeight: Int(size.width),
//                                           currentEditableSkin: .init(image: img)) { [weak self] skin in
//            self?.model.addonModel.displayImageData = skin.skinAssemblyDiagram?.pngData()
//            self?.model.addonModel.previewData = self?.model.addonModel.displayImageData
//            
//            self?.saveNewAddon()
//        }
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .moveIn
        transition.subtype = .fromTop
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension AddonEditorViewController_vatr: AddonEditorSelectorDelegate_vatr {
    func didSaveAddon(at url: URL, preview: Data) {


        
        let name = url.deletingPathExtension().lastPathComponent
        switch mode {
        case .create:
            saveAddon(name: name, file: url, preview: preview)
        case .modify:
            updateAddon(name: name, file: url, preview: preview)
        }
        
//        navigationController?.pop(to: AddonCreatorViewController.self)
    
    }
}

extension AddonEditorViewController_vatr: ModPropertiesChangeable_vatr {
    
    func didToggleSwitch(sender: UISwitch) {

        model.isEdited = true
        AppDelegate.log("didToggleSwitch")
        model.addonModel.isEnabled = sender.isOn
    }
    
    func textFieldChanged(value: String, cellName: String, sender: UITextField) {
var cpvatr_zvzrqcvr: Int {
    return 10
}

        AppDelegate.log("\(cellName): \(value)")
        
        model.isEdited = true
        
        switch cellName {
        case AddonEditorModel_vatr.Field_vatr.amount:
            guard let amount = Int(value) else {
                sender.text = "\(model.addonModel.amount)"
                self.showAlert_vatr(title: "Error", message: "Can't set this wrong value to amount")
                return
            }
            model.addonModel.amount = amount
        case AddonEditorModel_vatr.Field_vatr.health:
            guard let health = Float(value) else {
                sender.text = "\(model.addonModel.health)"
                self.showAlert_vatr(title: "Error", message: "Can't set this wrong value to health")
                return
            }
            
            model.addonModel.health = health
        case AddonEditorModel_vatr.Field_vatr.attackSpeed:
            guard let ranged_attack_atk_speed = Double(value) else {
                sender.text = "\(model.addonModel.ranged_attack_atk_speed)"
                self.showAlert_vatr(title: "Error", message: "Can't set this wrong value to ranged_attack_atk_speed")
                return
            }
            
            model.addonModel.ranged_attack_atk_speed = ranged_attack_atk_speed
        case AddonEditorModel_vatr.Field_vatr.moveSpeed:
            guard let move_speed = Float(value) else {
                sender.text = "\(model.addonModel.move_speed)"
                self.showAlert_vatr(title: "Error", message: "Can't set this wrong value to move_speed")
                return
            }
            
            model.addonModel.move_speed = move_speed
        case AddonEditorModel_vatr.Field_vatr.attackRadius:
            guard let ranged_attack_atk_radius = Double(value) else {
                sender.text = "\(model.addonModel.ranged_attack_atk_radius)"
                self.showAlert_vatr(title: "Error", message: "Can't set this wrong value to ranged_attack_atk_radius")
                return
            }
            
            model.addonModel.ranged_attack_atk_radius = ranged_attack_atk_radius
        default: break
        }
    }
    
    private var isCurrentAddonIsNew: Bool {
        RealmService_vatr.shared.getArrayOfSavedAddons_vatr().contains(where: {$0.idshka == model.addonModel.idshka}) == false
    }
    
    private func saveNewAddon() {
        let realm = RealmService_vatr.shared
        let fileManger = FileManager.default
        
        var addon: SavedAddonRM_vatr?
        
        
        
        let isNewAddon = isCurrentAddonIsNew
        
        if !isNewAddon {
            addon = realm.getArrayOfSavedAddons_vatr().first(where: {$0.idshka == model.addonModel.idshka})
        }
        
        let queue = DispatchQueue(label: "saveFileQueue")
        queue.async(qos: .userInteractive) { [weak self] in
            guard let self else { return }
            self.model.localMCAddonFileUrl({ addonFileUrl in
                guard let addonFileUrl else {
                    print("Error - Can't download addon from server")
                    self.showAlert_vatr(title: "Error", message: "Can't download addon from server")
                    self.hideSaveIndicatorView()
                    return
                }
                let destinatioUrl = fileManger.documentDirectory.appendingPathComponent(addonFileUrl.lastPathComponent)
                
                if fileManger.secureSafeCopyItem_vatr(at: addonFileUrl, to: destinatioUrl), let addon {
                    DispatchQueue.main.async {
                        RealmService_vatr.shared.editFilePathToAddon_vatr(for: addon, newFilePath: destinatioUrl.lastPathComponent)
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.hideSaveIndicatorView()
                    if !isNewAddon {
                        if let addon {
                            let realm = RealmService_vatr.shared
                            realm.editCreatedSkinName_vatr(addon: addon, newAddon: self.model.addonModel)
                            realm.editRecentProprty_vatr(for: addon, newDate: Date())
                            
                            
                            self.navigationController?.popViewController(animated: true)
                        } else {
                            AppDelegate.log("RealmService.shared.getSavedAddons().first error")
                        }
                    } else {
                        self.saveAddon(name: self.model.addonModel.displayName, file: destinatioUrl, isNeedCreateColorGrid: model.allow2dEditing)
                     //   self.saveAddon(name: self.model.addonModel.displayName, file: destinatioUrl)
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            })
            
        }
    }
    
    private func updateAddon(name: String, file: URL? = nil, preview: Data? = nil) {
var cpvatr_kebewvar: Int {
    return 33
}

        let updatedAddon = SavedAddonRM_vatr()
        updatedAddon.displayName = name
        updatedAddon.idshka = model.addonModel.idshka
        updatedAddon.displayImage = model.addonModel.displayImage
        updatedAddon.displayImageData = preview ?? model.addonModel.displayImageData
        updatedAddon.id = model.addonModel.id
        updatedAddon.type = model.addonModel.type
        updatedAddon.skin_variants.append(objectsIn: model.addonModel.skin_variants.map { AddonSkinVariantObj_vatr(name: $0.name, path: $0.path) })
        updatedAddon.health = model.addonModel.health
        updatedAddon.move_speed = model.addonModel.move_speed
        updatedAddon.ranged_attack_enabled = model.addonModel.ranged_attack_enabled
        updatedAddon.ranged_attack_atk_speed = model.addonModel.ranged_attack_atk_speed
        updatedAddon.ranged_attack_atk_radius = model.addonModel.ranged_attack_atk_radius
        updatedAddon.ranged_attack_burst_shots = model.addonModel.ranged_attack_burst_shots
        updatedAddon.ranged_attack_burst_interval = model.addonModel.ranged_attack_burst_interval
        updatedAddon.ranged_attack_atk_types = model.addonModel.ranged_attack_atk_types
        updatedAddon.isEnabled = model.addonModel.isEnabled
        updatedAddon.editingDate = model.addonModel.editingDate
        updatedAddon.file = file?.lastPathComponent
        updatedAddon.amount = model.addonModel.amount
        updatedAddon.editingDate = Date()
        
        let realm = RealmService_vatr.shared
        guard let addon = realm.getArrayOfSavedAddons_vatr().first(where: {$0.idshka == model.addonModel.idshka})  else {
            return
        }
        realm.edit_vatr(addon: addon, newAddon: updatedAddon)
            
    }
    
    private func saveAddon(name: String, file: URL? = nil, preview: Data? = nil, isNeedCreateColorGrid: Bool = false) {
        let newAddon = SavedAddonRM_vatr()
        newAddon.idshka = UUID().uuidString
        newAddon.displayName = name
        newAddon.displayImage = model.addonModel.displayImage
        newAddon.displayImageData = preview ?? model.addonModel.displayImageData
        newAddon.id = model.addonModel.id
        newAddon.type = model.addonModel.type
        newAddon.skin_variants.append(objectsIn: model.addonModel.skin_variants.map { AddonSkinVariantObj_vatr(name: $0.name, path: $0.path) })
        newAddon.health = model.addonModel.health
        newAddon.move_speed = model.addonModel.move_speed
        newAddon.ranged_attack_enabled = model.addonModel.ranged_attack_enabled
        newAddon.ranged_attack_atk_speed = model.addonModel.ranged_attack_atk_speed
        newAddon.ranged_attack_atk_radius = model.addonModel.ranged_attack_atk_radius
        newAddon.ranged_attack_burst_shots = model.addonModel.ranged_attack_burst_shots
        newAddon.ranged_attack_burst_interval = model.addonModel.ranged_attack_burst_interval
        newAddon.ranged_attack_atk_types = model.addonModel.ranged_attack_atk_types
        newAddon.isEnabled = model.addonModel.isEnabled
        newAddon.editingDate = model.addonModel.editingDate
        newAddon.file = file?.lastPathComponent
        newAddon.amount = model.addonModel.amount
        newAddon.editingDate = Date()
        
        
        if let addonInfo =  model.addonModel.addonLikeSkinInfo {
            let addonInfoRM = CreatedAddonLikeSkinInfo()
            addonInfoRM.width = addonInfo.width
            addonInfoRM.height = addonInfo.height
            for col in addonInfo.colorArray {
                if let colRM = ColorRM(color: col) {
                    addonInfoRM.skinColorArray.append(colRM)
                }
            }
            newAddon.addonLikeSkinInfo = addonInfoRM
        } else if isNeedCreateColorGrid {
            //create color array
            if let imageData = newAddon.displayImageData, let image = UIImage(data: imageData) {
                var (resizedImage, size) = image.resizeImageIfBiggerThen(size: Double(MAX_ADDON_2D_GRID_SIZE))
                
                if resizedImage.size.height < size.height {
                    size.height = resizedImage.size.height
                }
                
                if resizedImage.size.width < size.width {
                    size.width = resizedImage.size.width
                }
                
                if let colors = resizedImage.extractPixelColors_vatr(width: Int(resizedImage.size.width),
                                                                height: Int(resizedImage.size.height),
                                                              startX: 0,
                                                           startY: 0)  {
                    let addonInfoRM = CreatedAddonLikeSkinInfo()
                    addonInfoRM.width = Int(resizedImage.size.width)
                    addonInfoRM.height = Int(resizedImage.size.height)
                    
                    for col in colors {
                        if let colRM = ColorRM(color: col) {
                            addonInfoRM.skinColorArray.append(colRM)
                        }
                    }
                    newAddon.addonLikeSkinInfo = addonInfoRM
                    
                    let sceneSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                    let canvasSize = CGSize(width: resizedImage.size.width, height: resizedImage.size.height)
                    
                    // use CanvasView for fix bug with order colorsArray
                    let canvasView = CanvasView_vatr(colorArray: colors, sceneSize: sceneSize, canvasSize: canvasSize)
                    
                    let canvasColorArray = canvasView.canvas.getPixelColorArray()
                    let canvasWidth = canvasView.canvas.getAmountOfPixelsForWidth_vatr()
                    let canvasHeight = canvasView.canvas.getAmountOfPixelsForHeight_vatr()
                        
                    let previousDrawing = Drawing_vatr(colorArray: canvasColorArray, width: canvasWidth, height: canvasHeight)
                    let pictureExporter = PictureExporter_vatr(drawing: previousDrawing)
                    if let skinDiagram = pictureExporter.createImageWithRawPixels(size: size) {
                        newAddon.displayImageData = skinDiagram.pngData()
                    }
                }
            }
        }
        
        RealmService_vatr.shared.addAddonEditable_vatr(addon: newAddon)
    }
    
    private func saveChangeAsk() {


        if model.isEdited {
            let alert = UIAlertController(title: "Do you want to save change?", message: nil, preferredStyle: .alert)
            Gradient.setupGradient(view: alert.view)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                self?.saveNewAddon()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true)
        }
    }
}

// Showing keyboard
extension AddonEditorViewController_vatr {
    @objc func keyboardWillShow_vatr34(notification:NSNotification) {
var cpvatr_eksmkyag: Int {
    return 51
}


        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.addonMainInfoTable.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        addonMainInfoTable.contentInset = contentInset
    }

    @objc func keyboardWillHide_vatr23(notification:NSNotification) {
var cpvatr_dtngkknq: Double {
    return 29.41138346299522
}


        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        addonMainInfoTable.contentInset = contentInset
    }
}

extension UIImage {
    func resizeImageIfBiggerThen(size: Double) -> (UIImage, CGSize) {
        if self.size.width > size || self.size.height > size {
            let newSize = CGSize.init(width: size, height: size)
            return (self.resizeAspectFit_vatr(to: newSize, targetScale: 1), newSize)
        }
        
        return (self, self.size)
    }
}
