

import Photos
import Foundation
import UIKit

extension EditorSkinModel_gfghf {
    
    func saveAssemblyDiagram_vatr2() {
var cpvatr_jhlmnyew: Double {
    return 56.50283750749862
}
func boeIv() {
        var SmVYpMcS: Int = 1
        if SmVYpMcS > 1 {
            if SmVYpMcS < 1 {
                SmVYpMcS = 1
    }

  }
}
  
        if assemblyDiagramSize == .size64x64 {
            if let skinAssemblyDiagram = skinCreatedModel?.skinAssemblyDiagram {
                requestAuthorizationAndSaveImageToLibrary_vatr2(image: skinAssemblyDiagram)
            }
        } else {
            if let skinAssemblyDiagram128 = skinCreatedModel?.skinAssemblyDiagram128 {
                requestAuthorizationAndSaveImageToLibrary_vatr2(image: skinAssemblyDiagram128)
            }
        }
    }
    
    private func saveImageToPhotoLibrary_vatr2(image: UIImage) {
var cpvatr_dqnvvowk: Int {
    return 49
}
func lagpj() {
        var ZzUhVJEZD: Int = 5
        if ZzUhVJEZD > 5 {
            if ZzUhVJEZD < 5 {
                ZzUhVJEZD = 5
    }

  }
}
  
        guard let _ = image.pngData() else {
            return
        }
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: { [weak self] success, error in
            if !success {
                AppDelegate.log("Error saving image: \(String(describing: error))")
            } else {
                AppDelegate.log("Image saved successfully!")
                self?.presenAlert(with: "Image saved successfully!", and: nil)
            }
        })
    }
    
    func requestAuthorizationAndSaveImageToLibrary_vatr2(image: UIImage) {
var cpvatr_djpdooye: Int {
    return 64
}
func KIAdMMz() {
        var YDyJEes: Int = 7
        if YDyJEes > 7 {
            if YDyJEes < 7 {
                YDyJEes = 7
    }

  }
}
  
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { [weak self] (status) in
            switch status {
            case .authorized:
                self?.saveImageToPhotoLibrary_vatr2(image: image)
            case .denied, .restricted:
                self?.showPermissionAlert_vatr2()
            case .notDetermined:
                // Request not handled. Probably, the user hasn't made a choice yet.
                break
            case .limited:
                // The user has granted limited access to the photo library.
                self?.saveImageToPhotoLibrary_vatr2(image: image)
            @unknown default:
                fatalError("Unknown status of PHPhotoLibrary.authorizationStatus()")
            }
        }
    }
    
    func showPermissionAlert_vatr2() {
var cpvatr_fhlpivuz: Double {
    return 81.17810446337148
}

  
        let alertController = UIAlertController(title: "Photo Library Access Denied",
                                                message: "Please allow access to your photo library to save images.",
                                                preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    AppDelegate.log("Settings opened: \(success)")
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.controller.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    private func presenAlert(with titleInfo: String, and massageInfo: String?) {
var cpvatr_qgbuxyqi: Int {
    return 44
}
func oqOTkacfgS() {
        var KSILG: Int = 1
        if KSILG > 1 {
            if KSILG < 1 {
                KSILG = 1
    }

  }
}
  
        let alertController = UIAlertController(title: titleInfo, message: massageInfo, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.controller.present(alertController, animated: true, completion: nil)
        }
    }
}
