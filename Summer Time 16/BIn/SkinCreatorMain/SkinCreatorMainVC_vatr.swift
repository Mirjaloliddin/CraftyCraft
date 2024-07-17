

import UIKit

protocol CollectionSearchable_vatr {
    func filterData(with text: String?)
}

protocol SkinPikerHandler_vatr: AnyObject {
    func showSkinPicker(for item: SkinCreatedModel_vatr)
    func showEditSkinPicker(for item: SkinCreatedModel_vatr)
}

class SkinCreatorMainVC_vatr: UIViewController {
    
    private let collectionPreview = CollectionViewItemsPreview_vatr.initFromNib() as! CollectionViewItemsPreview_vatr
    
    private var menuCollectionView: UICollectionView {
        collectionPreview.collectionView
    }
    
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()
    private lazy var minecraftSkinManager: MinecraftSkinManagerProtocol_vatr = MinecraftSkinManager_vatr()
    
    
    var alertWindow: UIWindow?
    var blurView: UIVisualEffectView?
    
    weak var pickerShowerDelegate: SkinPikerHandler_vatr?
    

    lazy var model = SkinEditorVCModel_vatr()

    // MARK: - Outlets
    
    
    private weak var downloadButton_vatr: UIButton?
    private var filterText: String?
    
    // MARK: - Actions
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {

func lLATjBtEfS() {
        var OBSUXrXH: Int = 8
        if OBSUXrXH > 8 {
            if OBSUXrXH < 8 {
                OBSUXrXH = 8
    }

  }
}
  
        super.viewDidLoad()
        setupMenuCollectionView_vatr2()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_baklmvct: Int {
    return 69
}
func jkMaGEv() {
        var FhToddygJY: Int = 3
        if FhToddygJY > 3 {
            if FhToddygJY < 3 {
                FhToddygJY = 3
    }

  }
}
  
        super.viewWillAppear(animated)
        model.updateSkinsArray_err()
        menuCollectionView.layoutIfNeeded()
        menuCollectionView.reloadData()
        _viewWillAppear()
    }
    

    func _viewWillAppear() {
        menuCollectionView.reloadData()
        configureCollection_vatr()
    }
    
    func suggestionValueDidSelect(_ text: String) {
var cpvatr_feujzcdb: Double {
    return 44.17698210603122
}
func pCxKIw() {
        var jmcxURcb: Int = 5
        if jmcxURcb > 5 {
            if jmcxURcb < 5 {
                jmcxURcb = 5
    }

  }
}
  
        let items = filteredSkins()
        guard let index = items.firstIndex(where: { $0.name == text }) else { return }
        collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
        updatePreview_vatr(for: items[index])
    }
    
    private func configureCollection_vatr() {
func yAdJdTVjWr() {
        var prpdxRhDOb: Int = 4
        if prpdxRhDOb > 4 {
            if prpdxRhDOb < 4 {
                prpdxRhDOb = 4
    }

  }
}
  
        let allItems = filteredSkins()
        collectionPreview.updateEmptyState(isShowed: allItems.isEmpty)
        collectionPreview.setCrateEmptyTitle("You don't have any skins")
        if !allItems.isEmpty {
            updatePreview_vatr(for: allItems[model.previousSelectedSkin])
            model.selectedSkinIndex = model.previousSelectedSkin
            collectionPreview.selectRow(at: .init(row: model.previousSelectedSkin + 1, section: 0))
        }
    }
    
    func reloadCollectionViewjfdlklfsf() {
        menuCollectionView.layoutIfNeeded()
        menuCollectionView.reloadData()
    }
    
    
    // MARK: - Setup
    
    private func setupMenuCollectionView_vatr2() {
var cpvatr_cpqycolj: Int {
    return 34
}
func MFXYBVbF() {
        var dvyMo: Int = 10
        if dvyMo > 10 {
            if dvyMo < 10 {
                dvyMo = 10
    }

  }
}
  
        
        view.addSubview(collectionPreview)
        collectionPreview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionPreview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionPreview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionPreview.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionPreview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        menuCollectionView.layer.cornerRadius = 24
        menuCollectionView.allowsSelection = true
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.allowsMultipleSelection = false
        menuCollectionView.backgroundColor = .clear
        
        let nib = UINib(nibName: "SkinEditorCollectionViewCell_vatr", bundle: nil)
        menuCollectionView.register(nib, forCellWithReuseIdentifier: "SkinEditorCollectionViewCell_vatr")
        let nib2 = UINib(nibName: "CreateNewItemCollectionViewCell_vatr", bundle: nil)
        menuCollectionView.register(nib2, forCellWithReuseIdentifier: "CreateNewItemCollectionViewCell_vatr")
        let nib3 = UINib(nibName: "NewSkinCreatorCell", bundle: nil)
        menuCollectionView.register(nib3, forCellWithReuseIdentifier: "NewSkinCreatorCell")
        
        // Add targets
        collectionPreview.downloadButton_vatr.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }
            guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
                showNoInternetMess_vatr()
                return
            }
            
            guard filteredSkins().indices.contains(max(0, model.selectedSkinIndex)) else { return }
            let skinModel = filteredSkins()[max(0, model.selectedSkinIndex)]
            
            // self?.downloadButton_vatr = button
            let image = skinModel.is128sizeSkin ? skinModel.skinAssemblyDiagram128 : skinModel.skinAssemblyDiagram
            handleDownloadButtonTap_vatr(skinDiagram: image, name: skinModel.name)
            
        }), for: .touchUpInside)
        
        collectionPreview.deleteButton_vatr.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }
           //  let correctIndex = IndexPath(row: model.selectedSkinIndex + 1, section: 0)
            guard let selectedIndex = collectionPreview.collectionView.indexPathsForSelectedItems?.first else { return }
            handleDeleteButtonTap_vatr(indexPath: selectedIndex)
        }), for: .touchUpInside)
        
        collectionPreview.onImageViewTapAction = { [weak self] in
            guard let self else { return }
            pickerShowerDelegate?.showEditSkinPicker(for: model.getSelectedSkinModel())
        }
    }
}


// MARK: - CustomAlertViewControllerDelegate

extension SkinCreatorMainVC_vatr: CustomAlertViewControllerDelegate_vatr {
    
    func open2DEditor_vatr() {
        
        let selectedSkin = model.getSelectedSkinModel()
        let nextVC = BodyPartPickerViewController_vatr(currentEditableSkin: selectedSkin)
        
        dismissCustomAlert_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func open3DEditor_vatr() {
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: model.getSelectedSkinModel(), skinAssemblyDiagramSize: .size64x64)
        
        dismissCustomAlert_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func open3DEditor128x128_vatr() {
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: model.getSelectedSkinModel(), skinAssemblyDiagramSize: .size128x128)
        
        dismissCustomAlert_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func updatePreview_vatr(for skin: SkinCreatedModel_vatr) {
        
        collectionPreview.updatePreview_vatr(title: skin.name, image: skin.preview)
    }
    
    func importSkinFromGallery_vatr() {
        
        
        dismissCustomAlert_vatr()
        
        photoGalleryManager.getImageFromPhotoLibrary_vatr(from: self) { [unowned self] image in
            
            let selectedSkin = model.getSelectedSkinModel()
            guard let pixelizedImg = image.resizeAspectFit_vatr(targetScale: 1).squared else { return }
            
            selectedSkin.skinAssemblyDiagram = pixelizedImg
            let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkin, skinAssemblyDiagramSize: .size64x64)
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    

    
    func dismissCustomAlert_vatr() {

  
        alertWindow?.isHidden = true
        alertWindow = nil
        blurView?.removeFromSuperview()
    }
    
    private func presentCustomAlert(savedSkin: Bool, is128sizeSkin: Bool?) {

        let customAlert = PopUpViewController_vatr(showFor: savedSkin, is128sizeSkin: is128sizeSkin, delegate: self)
        
        let alertWindow = UIWindow(frame: view.frame)
        alertWindow.windowLevel = .alert
        alertWindow.rootViewController = UIViewController()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = alertWindow.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        alertWindow.rootViewController?.view.addSubview(blurView)
        
        alertWindow.rootViewController?.addChild(customAlert)
        alertWindow.rootViewController?.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: alertWindow.rootViewController)
        
        alertWindow.makeKeyAndVisible()
        alertWindow.windowScene = view.window?.windowScene
        
        customAlert.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customAlert.view.topAnchor.constraint(equalTo: alertWindow.rootViewController!.view.topAnchor),
            customAlert.view.bottomAnchor.constraint(equalTo: alertWindow.rootViewController!.view.bottomAnchor),
            customAlert.view.leadingAnchor.constraint(equalTo: alertWindow.rootViewController!.view.leadingAnchor),
            customAlert.view.trailingAnchor.constraint(equalTo: alertWindow.rootViewController!.view.trailingAnchor)
        ])
        
        self.alertWindow = alertWindow
        self.blurView = blurView
    }
}


//MARK: Collection Delegate Methods

extension SkinCreatorMainVC_vatr: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
//    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

//        
//        collectionView.cellForItem(at: .init(row: model.selectedSkinIndex + 1, section: 0))?.isSelected = false
//        
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//        return filteredSkins().count + 1 // +1 for first cell for plusMode
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let allItems = filteredSkins()
        
//        if indexPath.row == 0 {
//            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "CreateNewItemCollectionViewCell_vatr", for: indexPath) as! CreateNewItemCollectionViewCell_vatr
//            cell.setCrateTitle_vatr("Create new Skin")
//            cell.updateEmptyStyle(isShowed: allItems.isEmpty)
//            return cell
//            
//        } else {
//            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "SkinEditorCollectionViewCell_vatr", for: indexPath) as! SkinEditorCollectionViewCell_vatr
//            let skinModel = allItems[indexPath.item - 1]
//            
//            cell.publicMode_vatr(skinInfo: skinModel)
//            
//            cell.onDownloadButtonTapped = { [weak self] button in
//                guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
//                    self?.showNoInternetMess()
//                    return
//                }
//                
//                self?.downloadButton_vatr = button
//                let image = skinModel.is128sizeSkin ? skinModel.skinAssemblyDiagram128 : skinModel.skinAssemblyDiagram
//                self?.handleDownloadButtonTap(skinDiagram: image, name: skinModel.name)
//            }
//            
//            cell.onDeleteButtonTapped = { [weak self] in
//                guard let correctIndex = self?.menuCollectionView.indexPath(for: cell) else {
//                    AppDelegate.log("Error: checkUp indexPath!!!")
//                    return
//                }
//                self?.handleDeleteButtonTap(indexPath: correctIndex)
//            }
//            
//            return cell
//        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewSkinCreatorCell", for: indexPath) as? NewSkinCreatorCell else {return UICollectionViewCell()}
        if indexPath.item == 0 {
            cell.imageV.image = UIImage(named: "whitePlus")
        }
//        cell.imageV.image = allItems[indexPath.item - 1].skinAssemblyDiagram
        cell.imageV.image = UIImage(named: "Mockup_Content_vatr")
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        model.selectedSkinIndex = indexPath.item - 1
        
        if indexPath.item == 0 {
            pickerShowerDelegate?.showSkinPicker(for: model.getSelectedSkinModel())
            return false
        }
        
        return true
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

func FVFaaifZhh() {
        var KSXwq: Int = 4
        if KSXwq > 4 {
            if KSXwq < 4 {
                KSXwq = 4
    }

  }
}
        
        // New
        let selectedSkin = filteredSkins()[model.selectedSkinIndex]
        collectionPreview.updatePreview_vatr(title: selectedSkin.name, image: selectedSkin.preview)
  
        
        model.selectedSkinIndex = indexPath.item - 1 //to get correct index of choosed skin, as we always have +1 cell because of plusMode
        
        if indexPath.item == 0 {
            pickerShowerDelegate?.showSkinPicker(for: model.getSelectedSkinModel())
        } else {
            // Old
            // Editor 2d & 3d
            // pickerShowerDelegate?.showEditSkinPicker(for: model.getSelectedSkinModel())
            
            //            let is128Value = model.getSkinByIndex(index: (indexPath.item - 1))?.is128sizeSkin
            //            presentCustomAlert(savedSkin: true, is128sizeSkin: is128Value)
            
            
            // New
            let selectedSkin = filteredSkins()[model.selectedSkinIndex]
            collectionPreview.updatePreview_vatr(title: selectedSkin.name, image: selectedSkin.preview)
        }
       //  model.updateSkinsArray()
    }
}

//MARK: Cell Handlers

extension SkinCreatorMainVC_vatr {
    
    private func handleDeleteButtonTap_vatr(indexPath: IndexPath) {
  
        guard navigationController?.presentedViewController == nil else { return }
        let alert = UIAlertController(title: "Delete Skin", message: "Are you sure you want to delete this skin?", preferredStyle: .alert)

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
          
        // Animate the deletion
        if let selectedCell = self.menuCollectionView.cellForItem(at: indexPath) {
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
                    self?.menuCollectionView.performBatchUpdates({
                        self?.menuCollectionView.deleteItems(at: [indexPath])
                    }, completion: { [weak self] finish in
                        guard let self else { return }
                        guard finish else { return }
                        let numberOfCells = self.menuCollectionView.numberOfItems(inSection: 0)
                        
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
    
    private func handleDownloadButtonTap_vatr(skinDiagram: UIImage?, name: String) {
  
        guard let image = skinDiagram else { return }
        
        guard let data = image.pngData() else {
            AppDelegate.log("Failed to convert image to PNG data.")
            return
        }
        let fileURL = FileManager.default.cachesDirectory.appendingPathComponent("\(name).png")
        
        do {
            try data.write(to: fileURL)
            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
        } catch {
            AppDelegate.log("Failed to save image: \(error)")
            return
        }
        
        
        minecraftSkinManager.start_vatr(fileURL) { [weak self] url in
            self?.share_vatr(url: url, from: self?.downloadButton_vatr)
        }
    }
}

// MARK: - FlowLayout

extension SkinCreatorMainVC_vatr: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (UIScreen.main.bounds.width - 30)/2, height: (2 * UIScreen.main.bounds.height - 48)/7 )
    }
}

extension SkinCreatorMainVC_vatr: CollectionSearchable_vatr {
    func filterData(with text: String?) {

  
        if filterText == nil && text == nil { return }  //nothing changed
        
        filterText = text
        menuCollectionView.reloadData()
        
        
//        if let selectedSkin = model.lastSelectedSkin, let index = filteredSkins().firstIndex(of: selectedSkin) {
//            collectionPreview.selectRow(at: .init(row: index + 1, section: 0))
//            updatePreview_vatr(for: selectedSkin)
//        } else {
//
//        }
        
        guard !filteredSkins().isEmpty else { return }
        model.selectedSkinIndex = 0
        collectionPreview.selectRow(at: .init(row: model.selectedSkinIndex + 1, section: 0))
        
        let selectedSkin = filteredSkins()[model.selectedSkinIndex]
        collectionPreview.updatePreview_vatr(title: selectedSkin.name, image: selectedSkin.preview)
        
        collectionPreview.updateEmptyState(isShowed: false)
    }
}
