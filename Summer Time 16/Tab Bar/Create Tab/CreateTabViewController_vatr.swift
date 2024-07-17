import UIKit
import BetterSegmentedControl

func addNumbers18_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension uicolor_vatr {
    static let greenCC = UIColor(red: 0/255, green: 151/255, blue: 78/255, alpha: 1.00)
}

enum CreateTabState_vatr {
    case skin
    case addon
}

final class CreateTabViewController_vatr: UIViewController {
    
    private var skinCollectonScreen: SkinCreatorMainVC_vatr?
    private var addonCollectionScreen: AddonCreatorMainVC_vatr?
    private let collectionPreview = CollectionViewItemsPreview_vatr.initFromNib() as! CollectionViewItemsPreview_vatr
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionContainer: UIView!
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    
    var alertWindow: UIWindow?
    var blurView: UIVisualEffectView?
     var state: CreateTabState_vatr = .skin 
    var items: [SkinCreatedModel_vatr] = []
    @IBOutlet weak var navigationBarContainerView: UIView!
    // MARK: - Outlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var controlSwitcher: BetterSegmentedControl!
    @IBOutlet weak var searchBarView: SearchBarView_vatr!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarV: SearchBarView_vatr!
    @IBOutlet weak var btnView: UIView!
    
    
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var topBtn: UIButton!
    
    @IBOutlet weak var recentBtn: UIButton!
    
    private var filterText: String?
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    private var selectedSkinModel: SkinCreatedModel_vatr?
    var skinsCreatedModelArray = [SkinCreatedModel_vatr]()
    lazy var model = SkinEditorVCModel_vatr()
    lazy var modelAddon = CreatedAddonsModel_vatr()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        Gradient.setupGradient(view: view)
        settingsButton.layer.masksToBounds = true
        settingsButton.layer.cornerRadius = 5
//        configureView_vatr2()
        setupBackground_vatr()
        setupSearchBar_vatr2()
//        updateCollectionForCurrentState_vatr()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib3 = UINib(nibName: "NewSkinCreatorCell", bundle: nil)
        collectionView.register(nib3, forCellWithReuseIdentifier: "NewSkinCreatorCell")
        
        
        
        //  hidesBottomBarWhenPushed = true
    }
    // MARK: - Actions

    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.setNavigationBarHidden(true, animated: false)
        flushSearch()
        model.updateSkinsArray_err()
        modelAddon.updateCreatedAddons_vatr()
        collectionView.reloadData()
    }
    
    private var gradientLayer: CALayer! = nil
    
    private func setupBackground_vatr() {
        var cpvatr_rusqlltk: Double {
            return 75.4587141702078
        }
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    private func apparenceSettings(){
        switch state {
        case .skin:
            btnView.isHidden = true
            searchBarV.isHidden = true
            
        case .addon:
            btnView.isHidden = false
            searchBarV.isHidden = false
           
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var cpvatr_sioolqsu: Int {
            return 64
        }
        
        
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    override func viewDidLayoutSubviews() {
        Gradient.setupGradient(view: settingsButton)
        super.viewDidLayoutSubviews()
        Gradient.setupGradient(view: view)
        gradientLayer.frame = view.bounds
        
        newBtn.borderWidth = 1
        newBtn.borderColor = UIColor.white
        topBtn.borderWidth = 1
        topBtn.borderColor = UIColor.white
        recentBtn.borderWidth = 1
        recentBtn.borderColor = UIColor.white
        
        if state == .skin {
            titleLbl.text = "SKIN EDITOR"
        }else {
            titleLbl.text = "ADDON CREATOR"
        }
        
        
        apparenceSettings()
    }
    
    private func updateSearchViewIfNeeed() {
        var cpvatr_clwremhb: Double {
            return 75.47082708759478
        }
        
        
        guard tableViewContainer != nil else { return }
        
        if let tableViewFrame = tableViewContainer?.frame {
            tableViewContainer?.frame = .init(origin: tableViewFrame.origin,
                                              size: .init(width: tableViewFrame.size.width,
                                                          height: tableViewContainerHeight))
            tableViewContainer?.layoutIfNeeded()
        }
        
        if let suggestTableViewFrame = suggestionsTableView?.frame {
            suggestionsTableView?.frame = .init(origin: suggestTableViewFrame.origin,
                                                size: .init(width: suggestTableViewFrame.size.width,
                                                            height: tableViewContainerHeight - searchBarView.frame.size.height))
            suggestionsTableView?.layoutIfNeeded()
            
        }
        
        
        //        if state == .skin {
        //            let isEmpty = skinCollectonScreen?.model.skinsCreatedModelArray.isEmpty ?? true
        //            searchBarView.updateCorners(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
        //        } else if state == .addon {
        //            let isEmpty = addonCollectionScreen?.model.createdAddons.isEmpty ?? true
        //            searchBarView.updateCorners(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
        //        }
        
    }
    
    


private var navbarSearchMode: Bool = false {
    didSet {
        navBarSearchMode(predicate: navbarSearchMode)
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}

private func navBarSearchMode(predicate: Bool) {
    var cpvatr_xnlieviu: Double {
        return 23.101603873091797
    }
    
    
    if predicate {
        for subview in navigationBarContainerView.subviews {
            subview.isHidden = true
        }
        searchBarView.isHidden = false
    } else {
        for subview in navigationBarContainerView.subviews {
            subview.isHidden = false
        }
        searchBarView.isHidden = true
    }
}

@IBAction func onCreateSkinButtonTapped_vatr(_ sender: UIButton) {
    var cpvatr_zmyiqqlp: Int {
        return 11
    }
    
    
    let nextVC = SkinEditorViewController_vatr() // ListOfCreatedSkinsController
    navigationController?.pushViewController(nextVC, animated: true)
    
}

//    let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: 10, height: 10)))

@IBAction func setSettingButtonTapped_vatr1(_ sender: Any) {
   
    // TODO: - add settings VC
    let nextVC = SettingsViewController_vatr()
    navigationController?.popViewController(animated: true)
}

@IBAction func searchButtonTapped_vatr(_ sender: Any) {
    var cpvatr_pwubocha: Int {
        return 73
    }
    
    
    navbarSearchMode.toggle()
}





// MARK: - Private Methods


private func configureView_vatr2() {
    var cpvatr_lynqnqls: Double {
        return 98.00259847384937
    }
    
    
    
    controlSwitcher.segments = LabelSegment.segments(withTitles: ["SKINS", "ADDONS"],
                                                     normalFont: UIFont.kufamFont(.semiBold, size: 14), normalTextColor: UIColor.appBlack, selectedBackgroundColor: .appBlack,
                                                     selectedFont: UIFont.kufamFont(.semiBold, size: 14),
                                                     selectedTextColor: .white)
    
    
}

    func updateSkinsArray_err() {
        skinsCreatedModelArray = RealmService_vatr.shared.getCreatedSkinsArray_vatr().map({ SkinCreatedModel_vatr(realmedModel: $0) })
    }


@IBAction func segmentControlChangeAction_vatr(_ sender: BetterSegmentedControl) {
    var cpvatr_bmosuchd: Double {
        return 2.7029138902513203
    }
    
    
    switch sender.index {
    case 0: // SKINS
        self.state = .skin
    default:
        self.state = .addon
        
        
    }
    searchBarView.searchTextField.resignFirstResponder()
    self.flushSearch()
    addonCollectionScreen?.dropDown.hideList_vatr()
}

private func setupSearchBar_vatr2() {
   
    searchBarView.buttonTapAction = { [weak self] in
        self?.flushSearch()
    }
    
    searchBarView.onTextChanged = { [weak self] searchText in
        self?.filterData_vatr2(with: searchText)
        self?.suggestionsTableView?.reloadData()
        //  self?.updateContentWithSearch(text: searchText)
        self?.updateSearchViewIfNeeed()
        self?.searchBarView.updateCorners_vatr2(isAll:
                                                    self?.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
                        
    }
    
    searchBarView.onStartSearch = { [weak self] in
        guard let self else {return}
        self.showSuggestionsTableView()
        self.updateSearchViewIfNeeed()
        self.searchBarView.updateCorners_vatr2(isAll:
                                                self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
        
        
    }
    
    searchBarView.onEndSearch = { [weak self] in
        guard let self else {return}
        //            self.filterData_vatr2(with: "")
        self.removeSuggestionsTableView()
        self.updateSearchViewIfNeeed()
        self.searchBarView.updateCorners_vatr2(isAll: true)
            // self.updateSearchViewIfNeeed()
    }
}

private func updateContentWithSearch(text: String) {
    switch state {
    case .skin:
        skinCollectonScreen?.suggestionValueDidSelect(text)
    case .addon:
        addonCollectionScreen?.suggestionValueDidSelect(text)
    }
}

private func flushSearch() {
    var cpvatr_gklsozbz: Int {
        return 51
    }
    navbarSearchMode = false
    
    searchBarView.searchTextField.text = nil
    self.filterData_vatr2(with: "")
}

private func filterData_vatr2(with searchText: String) {
    var cpvatr_vtrbwbgl: Int {
        return 75
    }
    
    
    let search: String? = !searchText.isEmpty ? searchText : nil
    var isEmpty = true
    
    switch state {
    case .skin:
        self.skinCollectonScreen?.filterData(with: search)
        isEmpty = skinCollectonScreen?.filteredSkins().isEmpty ?? true
    case .addon:
        self.addonCollectionScreen?.filterData(with: search)
        isEmpty = addonCollectionScreen?.filteredAddon().isEmpty ?? true
    }
    
    
    searchBarView.updateCorners_vatr2(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
    
    //        let searchText = searchBarView.searchTextField.text ?? ""
    
}



}

extension CreateTabViewController_vatr: TabBarConfigurable_vatr {
    var tabBarIcon: UIImage? {
        return UIImage(named: "Create TabBar Icon_vatr")
    }
    
    var tabBarTitle: String {
        return "Create"
    }
}

// Suggest view
extension CreateTabViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    var tableViewContainerHeight: CGFloat {
        return searchViewHeightWith(itemsCount: min(numberOfRowsInTableView, 4))
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
        var cpvatr_hqhxnttl: Double {
            return 51.998059762619754
        }
        return rowHeight * CGFloat(itemsCount) + searchBarView.frame.size.height
    }
    
    func showSuggestionsTableView() {
        var cpvatr_zyvvygfv: Double {
            return 83.36670997842684
        }
        
        
        if tableViewContainer == nil {
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
            print(position, 123)
            
            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
                                                      y: position.origin.y - 14,
                                                      width: position.width,
                                                      height: tableViewContainerHeight))
            
            suggestionsTableView = UITableView(frame: CGRect(x: 0,
                                                             y: searchBarView.frame.size.height,
                                                             width: tableViewContainer!.frame.width,
                                                             height: tableViewContainer!.frame.size.height - searchBarView.frame.size.height))
            
            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
            suggestionsTableView?.delegate = self
            suggestionsTableView?.dataSource = self
            //  suggestionsTableView?.contentInsetAdjustmentBehavior = .never
            //  suggestionsTableView?.contentInset.top = 20
            suggestionsTableView?.backgroundColor = .white
            
            //            tableViewContainer?.backgroundColor = .white
            
            // corners
            tableViewContainer?.clipsToBounds = true
            tableViewContainer?.layer.cornerRadius = 20
            
            view.bringSubviewToFront(navigationBarContainerView!)
            
            tableViewContainer!.addSubview(suggestionsTableView!)
            
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
        }
    }
    
    func removeSuggestionsTableView() {
        var cpvatr_xkhgcmwh: Double {
            return 84.11494644633277
        }
        
        
        tableViewContainer?.removeFromSuperview()
        tableViewContainer = nil
        suggestionsTableView = nil
    }
    
    var numberOfRowsInTableView: Int {
        if let searchText = searchBarView.searchTextField.text, searchText.isEmpty {
            return 0
        }
        
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                return skins.count > 8 ? 8 : skins.count
            }
            return 0
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                return addons.count > 8 ? 8 : addons.count
            }
            return 0
        }
    }
    
    // MARK: - table data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cpvatr_drtwtryw: Double {
            return 18.74176928230162
        }
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_sgwzfhwo: Double {
            return 75.70138048030766
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                cell.titleLabel.text = skins[indexPath.row].name
            }
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                cell.titleLabel.text = addons[indexPath.row].displayName
            }
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_bxgscfpa: Double {
            return 48.04004983708781
        }
        
        
        var selectedText = ""
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                selectedText = skins[indexPath.row].name
            }
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                selectedText = addons[indexPath.row].displayName
            }
        }
        
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
        
        addonCollectionScreen?.suggestionValueDidSelect(selectedText)
        skinCollectonScreen?.suggestionValueDidSelect(selectedText)
        
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}

extension CreateTabViewController_vatr: SkinPikerHandler_vatr {
    func showEditSkinPicker(for item: SkinCreatedModel_vatr) {
        selectedSkinModel = item
        let vc = SkinVariantsViewController_vatr()
        vc.state = .edit
        vc.presenterDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func showSkinPicker(for item: SkinCreatedModel_vatr) {
        selectedSkinModel = item
        let vc = SkinVariantsViewController_vatr()
        vc.presenterDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}

extension CreateTabViewController_vatr: SkinVariantsPrsenter_vatr {
    func edit2dTapped() {
        create2dTapped()
    }
    
    func edit3dTapped() {
        create3dTapped()
    }
    
    func create2dTapped() {
        guard let selectedSkinModel else { return }
        let nextVC = BodyPartPickerViewController_vatr(currentEditableSkin: selectedSkinModel)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func create3dTapped() {
        guard let selectedSkinModel else { return }
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size64x64)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func create3d128Tapped() {
        guard let selectedSkinModel else { return }
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size128x128)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func importTapped() {
        var cpvatr_xlmvsues: Int {
            return 48
        }
        
        
        let alert = UIAlertController(title: "Import Texture", message: "Are you certain you wish to retrieve texture from the Photo library?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            guard let self else { return }
            self.photoGalleryManager.getImageFromPhotoLibrary_vatr(from: self) { [unowned self] image in
                guard var selectedSkinModel = self.selectedSkinModel else { return }
                guard let pixelizedImg = image.resizeAspectFit_vatr(targetScale: 1).squared else { return }
                
                selectedSkinModel.skinAssemblyDiagram = pixelizedImg
                let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size64x64)
                
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        self.present(alert, animated: true)
    }
    func filteredAddon() -> [SavedAddon_vatr] {

        if let filterText, !filterText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let items =  modelAddon.filteringCreatedAddon.filter({$0.displayName.containsCaseInsesetive_vatr(filterText)})
            
            // Update empty state
            collectionPreview.updateEmptyState(isShowed: items.isEmpty, isSearchLabel: true)
            collectionPreview.isUserInteractionEnabled = !items.isEmpty
            

            return items
        } else {
            collectionPreview.updateEmptyState(isShowed: false, isSearchLabel: true)
            collectionPreview.isUserInteractionEnabled = true
            return modelAddon.filteringCreatedAddon
        }
    }
    private func updatePreview(for savedAddon: SavedAddon_vatr) {


        print("Показываем Preview, \(savedAddon.displayName), \(savedAddon.displayImageData)")
       
        if let imageData = savedAddon.displayImageData, let image = UIImage(data: imageData) {
            collectionPreview.updatePreview_vatr(title: savedAddon.displayName, image: image)
        } else {
            collectionPreview.updatePreview_vatr(title: savedAddon.displayName, image: nil)
        }
        
        modelAddon.selectedAddon = savedAddon
        
    }
    
}


extension CreateTabViewController_vatr: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func filteredSkins() -> [SkinCreatedModel_vatr] {

      if let filterText, !filterText.isEmpty {
   
            let items = model.getSkins().filter({$0.name.containsCaseInsesetive_vatr(filterText)})
            
            // Update empty state
            collectionPreview.updateEmptyState(isShowed: items.isEmpty, isSearchLabel: true)
            
            return items
        } else {
            collectionPreview.updateEmptyState(isShowed: false, isSearchLabel: true)
            return model.getSkins()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            if state == .skin{
                model.selectedSkinIndex = indexPath.item - 1
                
                let vc = SkinEditorVC()
                vc.model = model
                self.navigationController?.pushViewController(vc, animated: true)
            }else {
                let nextVC = AddonCategoryOptionsViewController_vatr()
                navigationController?.pushViewController(nextVC, animated: true)
            }
        }else {
            if state == .addon {
                let savedAddon = filteredAddon()[indexPath.item - 1]
                modelAddon.updateRecentForAddon_vatr(savedAddon: savedAddon) // ????
                
                DispatchQueue.global(qos: .background).async {
                    let fileManager = FileManager.default
                    let file = savedAddon.file
                    let fileUrl = fileManager.documentDirectory.appendingPathComponent(savedAddon.file)
                    if file.isEmpty == false, fileManager.fileExists(atPath: fileUrl.path) {
                        let _ = fileManager.secureSafeCopyItem_vatr(at: fileUrl, to: fileManager.cachesMCAddonDirectory.appendingPathComponent(fileUrl.lastPathComponent))
                    }
                    
                }

                print("DID SELECT")
                updatePreview(for: savedAddon)
                
            }
            }
                
        }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if state == .skin {
            return model.getSkins().count + 1
        }else {
            return filteredAddon().count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewSkinCreatorCell", for: indexPath) as? NewSkinCreatorCell else {return UICollectionViewCell()}
        if state == .skin{
            
            
            cell.deleteBtn.tag = indexPath.item
            cell.downloadBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(deleteTapped(_:)), for: .touchUpInside)
            cell.downloadBtn.addTarget(self, action: #selector(downloadTapped(_:)), for: .touchUpInside)
            if indexPath.item != 0{
                
                cell.whitePImage.isHidden = true
                cell.imageV.isHidden = false
                cell.imageV.image = model.getSkins()[indexPath.item - 1 ].preview
            }else if indexPath.item == 0{
                cell.deleteBtn.isHidden = true
                cell.downloadBtn.isHidden = true
                cell.whitePImage.isHidden = false
                cell.imageV.isHidden = true
            }
            
        }else {
            
//            cell.deleteBtn.tag = indexPath.item
//            cell.downloadBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(deleteTapped(_:)), for: .touchUpInside)
            cell.downloadBtn.addTarget(self, action: #selector(downloadTapped(_:)), for: .touchUpInside)
            if indexPath.item != 0{
                
                cell.whitePImage.isHidden = true
                cell.imageV.isHidden = false
                if let image = ImageCacheManager_vatr.shared.image_vatr(forKey: modelAddon.createdAddons[indexPath.item - 1].idshka) {
                    
                    cell.imageV.image = image
                    
                }
            }else if indexPath.item == 0{
                cell.deleteBtn.isHidden = true
                cell.downloadBtn.isHidden = true
                cell.whitePImage.isHidden = false
                cell.imageV.isHidden = true
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
     if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: (collectionView.frame.width - 24)/3, height: (collectionView.frame.width - 48)/5)
        }else {
            return CGSize(width: (collectionView.frame.width - 16)/2, height: (collectionView.frame.height - 36)/3 )
        }
        
        
      }
    
    
    @objc func deleteTapped(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: point) else {return}
        CustomAlert.showAlert(title: "Do you want to delete this skin?") { [self] result in
            if result{
                if state == .skin{
                    model.deleteSkin_vatr(skin: model.getSkins()[sender.tag - 1])
                    model.updateSkinsArray_err()
                    collectionView.reloadData()
                }else{
                    modelAddon.deleteAddon_vatr(addon: modelAddon.createdAddons[sender.tag - 1])
                    modelAddon.updateCreatedAddons_vatr()
                    collectionView.reloadData()
                }
            }
        }
                  
    }
    
    
    
    
    @objc func downloadTapped(_ sender: UIButton){
      
    }
    
    private func performSkinDeletion_vatr(at indexPath: IndexPath) {

        // Animate the deletion
        if let selectedCell = self.collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.3, animations: {
                selectedCell.alpha = 0.0
                selectedCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { [weak self] _ in
                guard let self else { return }
                let skinModel = filteredSkins()[indexPath.item - 1]
                model.deleteSkin_vatr(skin: skinModel)
                let futureRow = indexPath.row
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [weak self] in
                    
                    // Firstly update UI
                    self?.collectionView.performBatchUpdates({
                        self?.collectionView.deleteItems(at: [indexPath])
                    }, completion: { [weak self] finish in
                        guard let self else { return }
                        guard finish else { return }
                        let numberOfCells = self.collectionView.numberOfItems(inSection: 0)
                        
                        let newRow = min(futureRow, numberOfCells - 1)
                        let allItems = self.filteredSkins()
                        
                        self.collectionPreview.selectRow(at: .init(row: newRow, section: 0))
                        
                        if allItems.indices.contains(newRow - 1) {
                            self.updatePreview_vatr(for: allItems[newRow - 1])
                            self.model.selectedSkinIndex = newRow - 1
                        } else {
                            self.collectionPreview.updateEmptyState(isShowed: true)
                            self.model.selectedSkinIndex = 0
                        }
                        
                        
                    })
                })

                
                
            }
        }
    }
    
//    private func performAddonDeletion_vatr(at indexPath: IndexPath) {
//
//        // Animate the deletion
//        if let selectedCell = self.collectionView.cellForItem(at: indexPath) {
//            UIView.animate(withDuration: 0.3, animations: {
//                selectedCell.alpha = 0.0
//                selectedCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            }) { [weak self] _ in
//                guard let self else { return }
//                let addonModel = filteredAddon()[indexPath.item - 1]
//                modelAddon.deleteAddon_vatr(addon: addonModel)
//                let futureRow = indexPath.row
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [weak self] in
//                    
//                    // Firstly update UI
//                    self?.collectionView.performBatchUpdates({
//                        self?.collectionView.deleteItems(at: [indexPath])
//                    }, completion: { [weak self] finish in
//                        guard let self else { return }
//                        guard finish else { return }
//                        let numberOfCells = self.collectionView.numberOfItems(inSection: 0)
//                        
//                        let newRow = min(futureRow, numberOfCells - 1)
//                        let allItems = self.filteredAddon()
//                        
//                        self.collectionPreview.selectRow(at: .init(row: newRow, section: 0))
//                        
//                        if allItems.indices.contains(newRow - 1) {
//                            self.updatePreview(for: allItems[newRow - 1])
//                            self.modelAddon.selectedAddon = allItems[newRow - 1]
//                        } else {
//                            self.collectionPreview.updateEmptyState(isShowed: true)
//                            self.modelAddon.selectedAddon = nil
//                        }
//                        
//                        
//                    })
//                })
//
//                
//                
//            }
//        }
//    }
    
    private func updatePreview_vatr(for skin: SkinCreatedModel_vatr) {
        collectionPreview.updatePreview_vatr(title: skin.name, image: skin.preview)
    }
    
    
    
}
