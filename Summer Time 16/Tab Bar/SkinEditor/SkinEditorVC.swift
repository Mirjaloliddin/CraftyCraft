//
//  SkinEditorVC.swift
//  Summer Time 16
//
//  Created by Qudrat on 03/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

class SkinEditorVC: UIViewController {
   
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()

    @IBOutlet weak var d2BackView: UIView!
    
    @IBOutlet weak var d3BackView: UIView!
    
    @IBOutlet weak var importBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    lazy var model = SkinEditorVCModel_vatr()
    var alertWindow: UIWindow?
    var blurView: UIVisualEffectView?
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    override func viewDidLayoutSubviews() {
        Gradient.setupGradient(view: view)
        Gradient.setupGradient(view: d2BackView)
        Gradient.setupGradient(view: d3BackView)
        d2BackView.layer.cornerRadius = 24
        d2BackView.layer.borderWidth = 1
        d2BackView.layer.borderColor = UIColor.white.cgColor
        d3BackView.layer.cornerRadius = 24
        d3BackView.layer.borderWidth = 1
        d3BackView.layer.borderColor = UIColor.white.cgColor
        cancelBtn.layer.borderWidth = 1
        cancelBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    func importSkinFromGallery_vatr() {

        photoGalleryManager.getImageFromPhotoLibrary_vatr(from: self) { [unowned self] image in
            
            let selectedSkin = model.getSelectedSkinModel()
            guard let pixelizedImg = image.resizeAspectFit_vatr(targetScale: 1).squared else { return }
            
            selectedSkin.skinAssemblyDiagram = pixelizedImg
            let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkin, skinAssemblyDiagramSize: .size64x64)
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
   
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    @IBAction func d2BtnTapped(_ sender: Any) {
        let vc = BodyPartPickerViewController_vatr()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func d3BtnTapped(_ sender: Any) {
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: model.getSelectedSkinModel(), skinAssemblyDiagramSize: .size64x64)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func importBtnTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Do you want to import ?", message: "Here’s an alert description that uses Auto Layout!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in }))
        alert.addAction(UIAlertAction(title: "Import", style: .default, handler: { _ in
            self.importSkinFromGallery_vatr()
        }))
        
        self.present(alert, animated: true)
        
        
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
    }
    
}

