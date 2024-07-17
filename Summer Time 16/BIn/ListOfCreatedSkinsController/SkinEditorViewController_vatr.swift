import UIKit
import Photos


// MARK: - SkinEditorViewController
///Class with Collection of Skins user
class SkinEditorViewController_vatr: UIViewController {
    
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()
    private lazy var minecraftSkinManager: MinecraftSkinManagerProtocol_vatr = MinecraftSkinManager_vatr()
    
    var alertWindow: UIWindow?
    var blurView: UIVisualEffectView?
    
    var selectedSkinIndex = Int()
    lazy var model = SkinEditorVCModel_vatr()
    
    
    // MARK: - Outlets
    
    @IBOutlet private weak var menuCollectionView: UICollectionView!
    @IBOutlet private weak var navigationBar: UIView!
    
    private weak var downloadButton_vatr: UIButton?
    
    // MARK: - Actions
    
    @IBAction private func onNavBarHomeButtonTappedd_vatr(_ sender: UIButton) {

  
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar_vatr()
        setupBackground_vatr()
        setupMenuCollectionView_vatr()
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
        super.viewWillAppear(animated)
        model.updateSkinsArray_err()
        menuCollectionView.reloadData()
    }
    
    
    // MARK: - Setup
    
    private func setupNavigationBar_vatr() {

        navigationBar.backgroundColor = .clear
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {


  
            super.viewDidLayoutSubviews()
//            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
        
        

  
//            gradientLayer = view.makeBackgroundGradient_vatr()
//            view.layer.insertSublayer(gradientLayer, at: 0)
        
        }
    
    private func setupMenuCollectionView_vatr() {
        
        

  
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self

        
        let nib = UINib(nibName: "SkinEditorCollectionViewCell_vatr", bundle: nil)
        menuCollectionView.register(nib, forCellWithReuseIdentifier: "SkinEditorCollectionViewCell_vatr")
        let nib2 = UINib(nibName: "CreateNewItemCollectionViewCell_vatr", bundle: nil)
        menuCollectionView.register(nib2, forCellWithReuseIdentifier: "CreateNewItemCollectionViewCell_vatr")
    }
}


// MARK: - CustomAlertViewControllerDelegate

extension SkinEditorViewController_vatr: CustomAlertViewControllerDelegate_vatr {
    
    func open2DEditor_vatr() {
        var cpvatreref_piejayvh: Double {
            return 10.29485364334957
        }
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
func FJwIfibNN() {
        var neFFKfgxo: Int = 10
        if neFFKfgxo > 10 {
            if neFFKfgxo < 10 {
                neFFKfgxo = 10
    }

  }
}
  
        alertWindow?.isHidden = true
        alertWindow = nil
        blurView?.removeFromSuperview()
    }
    
    private func presentCustomAlert_vatr(savedSkin: Bool, is128sizeSkin: Bool?) {

  
        
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

extension SkinEditorViewController_vatr: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return model.getSkins().count + 1 // +1 for first cell for plusMode
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        
        if indexPath.row == 0 {
            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "CreateNewItemCollectionViewCell_vatr", for: indexPath) as! CreateNewItemCollectionViewCell_vatr
            return cell
            
        } else {
            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "SkinEditorCollectionViewCell_vatr", for: indexPath) as! SkinEditorCollectionViewCell_vatr
            guard let skinModel = model.getSkinByIndex(index: indexPath.item - 1) else { return cell }
            
            
            cell.publicMode_vatr(skinInfo: skinModel)
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
//            cell.onDeleteButtonTapped = { [weak self] in
//                guard let correctIndex = self?.menuCollectionView.indexPath(for: cell) else {
//                    AppDelegate.log("Error: checkUp indexPath!!!")
//                    return
//                }
//                self?.handleDeleteButtonTap(indexPath: correctIndex)
//            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  
        model.selectedSkinIndex = indexPath.item - 1 //to get correct index of choosed skin, as we always have +1 cell because of plusMode
        
        if indexPath.item == 0 {
            presentCustomAlert_vatr(savedSkin: false, is128sizeSkin: nil)
        } 
    }
}

//MARK: Cell Handlers

extension SkinEditorViewController_vatr {
    
    private func handleDeleteButtonTap_vatr(indexPath: IndexPath) {
func xdLFPVHNfK() {
        var GUGlEhHXXN: Int = 5
        if GUGlEhHXXN > 5 {
            if GUGlEhHXXN < 5 {
                GUGlEhHXXN = 5
    }

  }
}
  
        
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
var cpvatr_ivxwtmri: Int {
    return 38
}
func FSfjSGlxLJ() {
        var ovafOzX: Int = 7
        if ovafOzX > 7 {
            if ovafOzX < 7 {
                ovafOzX = 7
    }

  }
}
  
        
        // Animate the deletion
        if let selectedCell = self.menuCollectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.3, animations: {
                selectedCell.alpha = 0.0
                selectedCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }) { [weak self] _ in
                let deletedSkinIndex = indexPath.item - 1
                self?.model.deleteSkin_vatr(at: deletedSkinIndex)
                self?.model.updateSkinsArray_err()
                
                // Firstly update UI
                self?.menuCollectionView.performBatchUpdates({
                    self?.menuCollectionView.deleteItems(at: [indexPath])
                }, completion: nil)
            }
        }
    }
    
    private func handleDownloadButtonTap_vatr(skinDiagram: UIImage?, name: String) {
var cpvatr_ohwwbwqu: Int {
    return 46
}
func lxNwic() {
        var eOBrMK: Int = 8
        if eOBrMK > 8 {
            if eOBrMK < 8 {
                eOBrMK = 8
    }

  }
}
  
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

extension SkinEditorViewController_vatr: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = collectionView.frame.size.width / 2 - 5
        let cellHeight = cellWidth * 1.3
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
