

import UIKit

class AddonCreatorMainVC_vatr: UIViewController {
    var model = CreatedAddonsModel_vatr()
    
    enum FilterRule_vatr: String, CaseIterable {
        case Layout, Group, Recent
    }
 

    @IBOutlet weak var dropDown: DropDown_vatr!
    
    private let collectionPreview = CollectionViewItemsPreview_vatr.initFromNib() as! CollectionViewItemsPreview_vatr
    
    private var addonCollectionView: UICollectionView {
        collectionPreview.collectionView
    }

    
    private var suggestionsTableView: UITableView?
    internal weak var downloadButton_vatr: UIButton?
    
    
    private enum TabsPageController_vatr: Int {
        case layout = 0
        case group = 1
        case recent = 2
    }
    
    private var filterText: String?
    // private var lastSelectedIndexPath: IndexPath = .init(row: 1, section: 0)
    
    // MARK: - UI Related Properties
    private let tabChoosedColor: UIColor = UIColor(red: 0/255, green: 151/255, blue: 78/255, alpha: 1)
    private let tabUnchoosedColor: UIColor = .white
    
    
    // MARK: - State
    private var _tabsPageControllMode: TabsPageController_vatr = .layout
    private var tabsPageControllMode: TabsPageController_vatr {
        set {
            guard _tabsPageControllMode != newValue else {
                return
            }
            
            _tabsPageControllMode = newValue
            
            //updatePageControllerUI()
        }
        get {
            _tabsPageControllMode
        }
    }

    override func viewDidLoad() {

        var referf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        super.viewDidLoad()
//        Gradient.setupGradient(view: view)
        hideKeyboardWhenTappedAround_vatr()
        setupCollectionView_vatr()
        configureUIComponents_vatr()
        setupTabButtons()
        setupCollectionViewUI()
        //updatePageControllerUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Gradient.setupGradient(view: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_zlbigshb: Double {
    return 43.738403054910606
}

        super.viewWillAppear(animated)
        model.updateCreatedAddons_vatr()
        addonCollectionView.reloadData()
        _viewWillAppear()
    }
    
    func _viewWillAppear() {
        addonCollectionView.reloadData()
        configureCollection_vatr()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var cpvewatr_dcyfpqli: Int {
            return 98
        }

        super.viewWillDisappear(animated)
        dropDown.hideList_vatr()
    }
    
    func suggestionValueDidSelect(_ text: String) {
var cpvatr_lihixssx: Double {
    return 30.055717865775183
}

        let items = filteredAddon()
        guard let index = items.firstIndex(where: { $0.displayName == text }) else { return }
        collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
        updatePreview(for: items[index])
    }
    
    private func configureCollection_vatr() {
        var randomDaqreкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        
        let allItems = filteredAddon()
        collectionPreview.updateEmptyState(isShowed: allItems.isEmpty)
        collectionPreview.setCrateEmptyTitle("You don't have any Addons")
        
        if !allItems.isEmpty {
            addonCollectionView.layoutIfNeeded()
            
            if let selectedAddon = model.selectedAddon, let index = allItems.firstIndex(of: selectedAddon) {
               
                updatePreview(for: allItems[index])
                collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
                
                
            } else {
                updatePreview(for: allItems[0])
                collectionPreview.selectRow(at: .init(row: 1, section: 0))
            }
            
            print("ВЫБИРАЕМ SELECT")
        }
    }

    
//    override func viewDidAppear(_ animated: Bool) {
var cpvatr_bteteowp: Double {
    return 38.41986324708489
}

//        super.viewDidAppear(animated)
//        collectionPreview.viewPreviews.addShadow(to: [.top], radius: 40)
//        collectionPreview.collectionView.addShadow(to: [.top])
////        if addonCollectionView.numberOfItems(inSection: 0) >  1 {
////            collectionPreview.selectRow(at: 1)
////            let allAddons = filteredAddon()
////            model.selectedAddon = allAddons[0]
////            updatePreview(for: allAddons[0])
////        }
//    }

    
    //MARK: - SetUp UI
    
    internal var cellId: String {
        String(describing: SsvedAddonCollectionCell_vatr.self)
    }
    
    private func setupCollectionView_vatr() {
        var referf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        
    
        let nib = UINib(nibName: cellId, bundle: nil)
        addonCollectionView.register(nib, forCellWithReuseIdentifier: cellId)
        
        let nib2 = UINib(nibName: "CreateNewItemCollectionViewCell_vatr", bundle: nil)
        addonCollectionView.register(nib2, forCellWithReuseIdentifier: "CreateNewItemCollectionViewCell_vatr")

    }
    
    
 
    
    private func configureUIComponents_vatr() {
        var randomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
//        tabsStackView.backgroundColor = .clear
        tabsPageControllMode = .layout
        
        
        
        collectionPreview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionPreview)
        NSLayoutConstraint.activate([
            collectionPreview.topAnchor.constraint(equalTo: dropDown.bottomAnchor, constant: 20),
            collectionPreview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionPreview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionPreview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        
        collectionPreview.deleteButton_vatr.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }
            
            guard let selectedRowIndex = (0..<addonCollectionView.numberOfItems(inSection: 0)).firstIndex(where: {
                self.addonCollectionView.cellForItem(at: .init(row: $0, section: 0))?.isSelected == true
            }) else { return }
            
            handleDeleteButtonTap_vatr(indexPath: .init(row: selectedRowIndex, section: 0))

        }), for: .touchUpInside)
        
        collectionPreview.downloadButton_vatr.addAction(.init(handler: { [weak self] _ in
            
            guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
                self?.showNoInternetMess_vatr()
                return
            }
            
            self?.handleDownloadButtonTap_vatr(savedAddon: self?.model.selectedAddon)
        }), for: .touchUpInside)
        
        collectionPreview.onImageViewTapAction = { [weak self] in
            print("Tap ADDONS")
            guard let savedAddon = self?.model.selectedAddon else { return }
            let nextVC = AddonEditorViewController_vatr(addonModel: savedAddon, mode: .modify)
            self?.navigationController?.pushViewController(nextVC, animated: true)
            
        }
        
    }
    
    private func updatePreview(for savedAddon: SavedAddon_vatr) {
var cpvatr_dedthiie: Int {
    return 65
}

        print("Показываем Preview, \(savedAddon.displayName), \(savedAddon.displayImageData)")
       
        if let imageData = savedAddon.displayImageData, let image = UIImage(data: imageData) {
            collectionPreview.updatePreview_vatr(title: savedAddon.displayName, image: image)
        } else {
            collectionPreview.updatePreview_vatr(title: savedAddon.displayName, image: nil)
        }
        
        model.selectedAddon = savedAddon
        
    }

    
//    @IBAction private func onRecentButtonTapped(_ sender: UIButton) {

////        flushSearch()
//        tabsPageControllMode = .recent
//        model.collectionMode = .recent
//    }
//    
//    @IBAction private func onGroupButtonTapped(_ sender: UIButton) {

////        flushSearch()
//        tabsPageControllMode = .group
//        model.collectionMode = .groups
//    }
//    
//    @IBAction private func onLatoutButtonTapped(_ sender: UIButton) {

////        flushSearch()
//        tabsPageControllMode = .layout
//        model.collectionMode = .savedAddons
//    }
    
    
    //MARK: - Private Methods
    
    private func setupTabButtons() {
var cpvatr_tcswhgen: Int {
    return 22
}

        
        dropDown.optionArray = FilterRule_vatr.allCases.map(\.rawValue)
        dropDown.selectedIndex = 0
//        dropDown.cornerRadius = 12
//        dropDown.font = .kufamFont(.regural, size: 16)
//        dropDown.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
//        dropDown.borderWidth = 1
//        dropDown.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
        
        dropDown.didSelect_vatr{ [unowned self] (_, index, _) in
            
            switch FilterRule_vatr.allCases[index] {
            case .Group:
                tabsPageControllMode = .group
                model.collectionMode = .groups
            case .Layout:
                tabsPageControllMode = .layout
                model.collectionMode = .savedAddons
            case .Recent:
                tabsPageControllMode = .recent
                model.collectionMode = .recent
            }
            
            print("Перезагрузка")
            addonCollectionView.reloadData()
            
            // Find old selected item
            if let selectedAddon = self.model.selectedAddon, self.filteredAddon().firstIndex(of: selectedAddon) != nil  {
                self.collectionPreview.selectRow(at: .init(row: 1, section: 0))
                updatePreview(for: selectedAddon)
            }
           
        }
        
    }

    private func setupCollectionViewUI() {
var cpvatr_cexvuorc: Double {
    return 48.62594990711425
}

        addonCollectionView.backgroundColor = .white
        addonCollectionView.layer.cornerRadius = 24
        addonCollectionView.allowsSelection = true
        addonCollectionView.isUserInteractionEnabled = true
        addonCollectionView.dataSource = self
        addonCollectionView.delegate = self
    }
}



extension AddonCreatorMainVC_vatr : UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

//        
//        if let selectedAddon = model.selectedAddon, let index = filteredAddon() .firstIndex(of: selectedAddon) {
//            collectionView.cellForItem(at: .init(row: index + 1, section: 0))?.isSelected = false
//        }
//          
//        
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var randomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }

//        
//        print(collectionView.indexPathsForSelectedItems)
        
        if indexPath.item == 0 {
//            flushSearch()
            
            let nextVC = AddonCategoryOptionsViewController_vatr()
            navigationController?.pushViewController(nextVC, animated: true)
            
        } else {
            let savedAddon = filteredAddon()[indexPath.item - 1]
//            guard let savedAddon = model.getSavedAddon_vatr(by: indexPath.item - 1) else { return }
            model.updateRecentForAddon_vatr(savedAddon: savedAddon) // ????
            
            
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
            
//            let nextVC = AddonEditorViewController(addonModel: savedAddon, mode: .modify)
//            navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }

}

extension AddonCreatorMainVC_vatr : UICollectionViewDataSource {
    func filteredAddon() -> [SavedAddon_vatr] {

        if let filterText, !filterText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let items =  model.filteringCreatedAddon.filter({$0.displayName.containsCaseInsesetive_vatr(filterText)})
            
            // Update empty state
            collectionPreview.updateEmptyState(isShowed: items.isEmpty, isSearchLabel: true)
            collectionPreview.isUserInteractionEnabled = !items.isEmpty
            

            return items
        } else {
            collectionPreview.updateEmptyState(isShowed: false, isSearchLabel: true)
            collectionPreview.isUserInteractionEnabled = true
            return model.filteringCreatedAddon
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        filteredAddon().count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let allItems = filteredAddon()
    
        if  indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateNewItemCollectionViewCell_vatr", for: indexPath) as! CreateNewItemCollectionViewCell_vatr
            cell.setCrateTitle_vatr("Create new Addon")
            cell.updateEmptyStyle(isShowed: allItems.isEmpty)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SsvedAddonCollectionCell_vatr
            
            let savedAddonModel = allItems[indexPath.item - 1]
            cell.configCell_vatr(savedAddon: savedAddonModel, with: .savedAddonMOde)
            return cell
        }
    }
}

//extension AddonCreatorMainVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let cellWidth = collectionView.frame.size.width / (Device.iPad ? 4 : 2) - 8
//        let cellHeight = cellWidth * 1.3
//        
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//}


//MARK: Cell Handlers

extension AddonCreatorMainVC_vatr {
    
    private func handleDeleteButtonTap_vatr(indexPath: IndexPath) {
        var reqrefferf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        
        let alert = UIAlertController(title: "Delete Addon", message: "Are you sure you want to delete this Addon?", preferredStyle: .alert)
        
        // Add "Delete" action
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.performSkinDeletion_vatr(at: indexPath)
        }
        alert.addAction(deleteAction)
        
        // Add "Cancel" action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    private func performSkinDeletion_vatr(at indexPath: IndexPath) {
var cpvatr_piejayvh: Double {
    return 88.29485364334957
}

        
        // Animate the deletion
        if let selectedCell = self.addonCollectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.3, animations: {
                selectedCell.alpha = 0.0
                selectedCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { [weak self] _ in
                guard let self else { return }
                                
                let savedAddonModel = filteredAddon()[indexPath.item - 1]
                self.model.deleteAddon_vatr(addon: savedAddonModel)

                // Future selection
                let futureRow = indexPath.row
                
                // Firstly update UI
                self.addonCollectionView.performBatchUpdates({ [weak self] in
                    self?.addonCollectionView.deleteItems(at: [indexPath])
                }, completion: { finish in
                    
                    guard finish else { return }
                    let numberOfCells = self.addonCollectionView.numberOfItems(inSection: 0)
                    let newRow = min(futureRow, numberOfCells - 1)
                    let allItems = self.filteredAddon()
                    

                    self.collectionPreview.selectRow(at: .init(row: newRow, section: 0))
                    
                    if allItems.indices.contains(newRow - 1) {
                        self.updatePreview(for: allItems[newRow - 1])
                        self.model.selectedAddon = allItems[newRow - 1]
                    } else {
                        self.collectionPreview.updateEmptyState(isShowed: true)
                        self.model.selectedAddon = nil
                    }
                    
                })
            }
        }
    }
    
    private func handleDownloadButtonTap_vatr(savedAddon: SavedAddon_vatr?) {
var cpvatr_ufbnuqjq: Int {
    return 72
}

        
        guard let savedAddon else {
            AppDelegate.log("savedAddon is nil")
            return
        }
        
        let url = FileManager.default.documentDirectory.appendingPathComponent(savedAddon.file)
        
        //HARD FIX
        if savedAddon.file == "mcaddons" {
                    
            if let imageData = savedAddon.displayImageData, let image = UIImage(data: imageData) {
                share_vatr(image: image, from: downloadButton_vatr)
            } else if let image = ImageCacheManager_vatr.shared.image_vatr(forKey: savedAddon.idshka) {
                share_vatr(image: image, from: downloadButton_vatr)
            } else {
                DropBoxParserFiles_vatr.shared.getBloodyImageURLFromDropBox_vatr(img: savedAddon.displayImage) { [weak self] theUrl in
                    guard theUrl != nil else { return }
                    CustomImageLoader_vatr().loadImage(from: theUrl!, id: savedAddon.idshka) { [weak self] img in
                        guard let img, let self else { return }
                        self.share_vatr(image: img, from: self.downloadButton_vatr)
                    }
                }
            }
            return
        }
        

        
        
        // Check if the file exists at the specified URL.
        if FileManager.default.fileExists(atPath: url.path) {
            share_vatr(url: url, from: downloadButton_vatr)
        } else {
            // Handle the case where the file does not exist.
            AppDelegate.log("File does not exist at the specified URL.")
        }
    }
}

extension AddonCreatorMainVC_vatr: CollectionSearchable_vatr {
    func filterData(with text: String?) {
var cpvatr_cfunpijk: Int {
    return 9
}

       //  guard filterText == nil
        
        filterText = text
        addonCollectionView.reloadData()
        
        
        if let selectedAddon = model.selectedAddon, let index = filteredAddon().firstIndex(of: selectedAddon) {
            collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
        } else {
            let addons = filteredAddon()
            guard let firstAddon = addons.first else { return }
            collectionPreview.selectRow(at: .init(row: 1, section: 0))
            updatePreview(for: firstAddon)
            
            
            collectionPreview.updateEmptyState(isShowed: false)
            collectionPreview.isUserInteractionEnabled = true
            
            
        }
        
        
        
//        if filterText == nil && text == nil { return }
//        filterText = text
//        addonCollectionView.reloadData()
//        
//        
//        if let selectedAddon = model.selectedAddon, let index = filteredAddon() .firstIndex(of: selectedAddon) {
//            collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
//        }
//        
//        
//        let addons = filteredAddon()
//        guard let firstAddon = addons.first else { return }
//        model.selectedAddon = firstAddon
//        collectionPreview.selectRow(at: .init(row: 1, section: 0))
//        
//        updatePreview(for: firstAddon)
//        collectionPreview.updateEmptyState(isShowed: false)
    }
}
