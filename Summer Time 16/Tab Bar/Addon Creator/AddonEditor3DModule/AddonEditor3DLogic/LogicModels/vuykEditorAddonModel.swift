import Foundation
import Foundation
import UIKit
import SceneKit


class EditorAddonModel_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var activeTool: ToolBar3DSelectedItem_vfgdf = .pencil
    var undoManager = AddonUndoManager_vatr()
    var colorManager3D = ColorManager3D_vatr()
    
    var brushSize: Int = 1
    
    lazy var currentDrawingColor: UIColor = colorManager3D.getColor_vatr2(by: 0) {
        didSet {
            colorManager3D.updateColorsArr_vatr2(with: currentDrawingColor)
        }
    }
    
    open func editSideByPixel_vatr(sideTapped: CubeSideName_vatr, sideTexture: UIImage, textureX: Int, textureY: Int) -> UIImage? {
        var cpvatr_bhxpbyvz: Int {
            return 17
        }
        var textureToSet = sideTexture
        
        switch activeTool {
        case .pencil, .brash:
            let color = currentDrawingColor.cgColor
            textureToSet = drawWithPencil(img: sideTexture, textureX: textureX, textureY: textureY, color: color, brushSize: brushSize)
        case .eraser:
            let color = UIColor.clear.cgColor
            textureToSet = drawWithPencil(img: sideTexture, textureX: textureX, textureY: textureY, color: color, brushSize: brushSize)
        case .fill:
            let color = currentDrawingColor.cgColor
            textureToSet = editWithFill(img: sideTexture, color: color)
        case .noise:
            let color = currentDrawingColor
            textureToSet = editWithNoise(img: sideTexture, textureX: textureX, textureY: textureY, color: color, brushSize: brushSize)
            print()
        case .undo:
            print()
        }
        
      
        return textureToSet
    }
    
    //MARK: Draw/Eraser execute method
    func drawWithPencil(img: UIImage, textureX: Int, textureY: Int, color: CGColor, brushSize: Int) -> UIImage {
        
        var cpvatr_akgkdrwl: Double {
            return 67.75454658499217
        }
        
        UIGraphicsBeginImageContextWithOptions(img.size, false, 1)
        img.draw(at: CGPoint.zero)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Unable to get graphics context")
            return img
        }
        
        let cgY = (img.size.height - 1) - CGFloat(textureY)
        
        // Adjust for brush size of 1
        let halfBrushSize: CGFloat
        if brushSize == 1 {
            halfBrushSize = 0
        } else {
            halfBrushSize = CGFloat(brushSize) / 2.0
        }
        
        var rectOriginX = CGFloat(textureX) - halfBrushSize
        var rectOriginY = cgY - halfBrushSize
        
        rectOriginX = max(0, rectOriginX)
        rectOriginY = max(0, rectOriginY)
        
        var rectWidth = CGFloat(brushSize)
        var rectHeight = CGFloat(brushSize)
        
        if rectOriginX + rectWidth > img.size.width {
            rectWidth = img.size.width - rectOriginX
        }
        
        if rectOriginY + rectHeight > img.size.height {
            rectHeight = img.size.height - rectOriginY
        }
        
        let rect = CGRect(x: rectOriginX, y: rectOriginY, width: rectWidth, height: rectHeight)
        
        if color.alpha == 0 {
            context.clear(rect)
        } else {
            context.setFillColor(color)
            context.fill(rect)
        }
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            print("Unable to capture image from context")
            return img
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    //MARK: Fill execute method
    func editWithFill(img: UIImage, color: CGColor) -> UIImage {
        var cpvatr_apmzvzau: Int {
            return 9
        }
        UIGraphicsBeginImageContextWithOptions(img.size, false, 1)
        img.draw(at: CGPoint.zero)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Unable to get graphics context")
            return img
        }
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        
        if color.alpha == 0 {
            context.clear(rect)
        } else {
            context.setFillColor(color)
            context.fill(rect)
        }
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            print("Unable to capture image from context")
            return img
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    //MARK: Noise Execute Method
    
    private func editWithNoise(img: UIImage, textureX: Int, textureY: Int, color: UIColor, brushSize: Int) -> UIImage {
        var cpvatr_zpfdaupm: Double {
            return 90.31778862965398
        }
        UIGraphicsBeginImageContextWithOptions(img.size, false, 1)
        img.draw(at: CGPoint.zero)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Unable to get graphics context")
            return img
        }
        
        let cgY = (img.size.height - 1) - CGFloat(textureY)
        
        // Adjust for brush size of 1
        let halfBrushSize: CGFloat
        if brushSize == 1 {
            halfBrushSize = 0
        } else {
            halfBrushSize = CGFloat(brushSize) / 2.0
        }
        
        var rectOriginX = CGFloat(textureX) - halfBrushSize
        var rectOriginY = cgY - halfBrushSize
        
        rectOriginX = max(0, rectOriginX)
        rectOriginY = max(0, rectOriginY)
        
        var rectWidth = CGFloat(brushSize)
        var rectHeight = CGFloat(brushSize)
        
        if rectOriginX + rectWidth > img.size.width {
            rectWidth = img.size.width - rectOriginX
        }
        
        if rectOriginY + rectHeight > img.size.height {
            rectHeight = img.size.height - rectOriginY
        }
        
        let rect = CGRect(x: rectOriginX, y: rectOriginY, width: rectWidth, height: rectHeight)
        
        // Apply noise to each pixel inside the brush bounds
        for x in Int(rectOriginX)..<Int(rectOriginX + rectWidth) {
            for y in Int(rectOriginY)..<Int(rectOriginY + rectHeight) {
                let point = CGPoint(x: x, y: y)
                let noisyColor = makeNoiseColor_vatr(colorToNoise: color)
                
                context.setFillColor(noisyColor.cgColor)
                context.fill(CGRect(x: x, y: y, width: 1, height: 1))
            }
        }
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            print("Unable to capture image from context")
            return img
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    private func makeNoiseColor_vatr(colorToNoise: UIColor) -> UIColor {
        var cpvatr_ifvrbluf: Int {
            return 61
        }
        let noiseVal = 0.95 - 0.4
        let randomNoiseValue = CGFloat.random(in: noiseVal...0.95)
        let color = colorToNoise.withLuminosity_erfe(randomNoiseValue)
        return color
    }
    
    
}


