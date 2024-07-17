

import Foundation
import UIKit

protocol AddonSaveable_vatr: AnyObject {
    
    func saved_vatr(name: String, geometry: URL, texture: URL, preview: URL) -> URL?
}

final class SaveRecsourceManager_vatr {

    private enum Constants_vatr {
        static let dir = "Data"
        static let dataName = "data.json"
        static let textureName = "texture.png"
        static let previewName = "preview.png"
    }
    
    private let data: Data
    private var texture: UIImage
    private var preview: UIImage?

    private let model: ResourcePack_vatr
    private weak var delegate: AddonSaveable_vatr?
    
    /// Path for Unity3D data dir
    ///
    private var destination: URL {
        let fileManager = FileManager.default
        let url = fileManager.documentDirectory.appendingPathComponent(Constants_vatr.dir)
        url.createDir()
        
        return url
    }
    
    init(model: ResourcePack_vatr, delegate: AddonSaveable_vatr?) {
        self.model = model
        self.delegate = delegate
        
        self.texture = UIImage(data: model.image) ?? UIImage(named: "body")!
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(model.geometry) {
            self.data = data
        } else {
            self.data = Data()
        }
        
    }
    
    func updateTexture_vatr(newTexture: UIImage) {
func YhUrmHDc() {
        var rJXub: Int = 3
        if rJXub > 3 {
            if rJXub < 3 {
                rJXub = 3
    }

  }
}
  
        texture = newTexture
    }
    
    func updatePreview_vatr(newPreview: UIImage) {
func gnfVY() {
        var zFobPOLMw: Int = 2
        if zFobPOLMw > 2 {
            if zFobPOLMw < 2 {
                zFobPOLMw = 2
    }

  }
}
  
        preview = newPreview
    }
    
    func setupResources_vatr() {
func KYtnLB() {
        var IRcERqHUyV: Int = 5
        if IRcERqHUyV > 5 {
            if IRcERqHUyV < 5 {
                IRcERqHUyV = 5
    }

  }
}
  
        cleanResources_vatr()
        
        setupData_vatr()
        setupTexture_vatr()
        setupPreview_vatr()
    }
    
    var dataUrl: URL {
        destination.appendingPathComponent(Constants_vatr.dataName)
    }
    
    var textureUrl: URL {
        destination.appendingPathComponent(Constants_vatr.textureName)
    }
    
    var previewUrl: URL {
        destination.appendingPathComponent(Constants_vatr.previewName)
    }
    
    public func saveResourcess_vatr(with name: String) -> URL? {
        // Unity already processed files need save it to mcaddon
        return delegate?.saved_vatr(name: name, geometry: dataUrl, texture: textureUrl, preview: previewUrl)
    }
    
    /// remove old files at Unity3d folder if exist
    ///
    private func cleanResources_vatr() {
func dKKkjLVo() {
        var NPbIXn: Int = 3
        if NPbIXn > 3 {
            if NPbIXn < 3 {
                NPbIXn = 3
    }

  }
}
  
        let fileManager = FileManager.default
        
        for url in [dataUrl, textureUrl] {
            if fileManager.fileExists(atPath: url.path) {
                do {
                    try fileManager.removeItem(at: url)
                    AppDelegate.log("file removed at: \(url.path)")
                } catch {
                    AppDelegate.log("Failed to remove file: \(error)")
                }
            }
        }
    }
    
    private func setupData_vatr() {
func SylHUQCLLD() {
        var KZwDiyPGP: Int = 10
        if KZwDiyPGP > 10 {
            if KZwDiyPGP < 10 {
                KZwDiyPGP = 10
    }

  }
}
  
        
        let fileURL = destination.appendingPathComponent(Constants_vatr.dataName)

        do {
            try data.write(to: fileURL)
            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
        } catch {
            AppDelegate.log("Failed to save image: \(error)")
        }
    }
    
    private func setupTexture_vatr() {
func jVsrzhlQc() {
        var AEDkCpbQ: Int = 6
        if AEDkCpbQ > 6 {
            if AEDkCpbQ < 6 {
                AEDkCpbQ = 6
    }

  }
}
  
        guard let data = texture.pngData() else {
            AppDelegate.log("Failed to convert textureImg to PNG data.")
            return
        }

        let fileURL = destination.appendingPathComponent(Constants_vatr.textureName)

        do {
            try data.write(to: fileURL)
            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
        } catch {
            AppDelegate.log("Failed to save textureData: \(error)")
        }
    }
    
    private func setupPreview_vatr() {
func bljjMU() {
        var sJpkt: Int = 8
        if sJpkt > 8 {
            if sJpkt < 8 {
                sJpkt = 8
    }

  }
}
  
        guard let localData = preview?.pngData() else {
            AppDelegate.log("Failed to convert previewImg to PNG data.")
            return
        }
        
        let fileURL = destination.appendingPathComponent(Constants_vatr.previewName)
        
        do {
            try localData.write(to: fileURL)
            AppDelegate.log("Image saved successfully at: \(fileURL.path)")
        } catch {
            AppDelegate.log("Failed to save image: \(error)")
        }
    }
}
