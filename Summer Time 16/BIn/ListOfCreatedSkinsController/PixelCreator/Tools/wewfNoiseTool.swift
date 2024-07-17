

import Foundation
import UIKit.UIGestureRecognizer

class NoiseTool_vatr: Tool_vatr {
    private var pixelSize: CGFloat?
    private var previusBasePixel: Pixel_vatr?
    
    func handleTapFrom_vatr(_ sender: UITapGestureRecognizer, _ controller: SkinCreatorViewController_vatr) {
func YYNbOjOss() {
        var DrUWYpAhc: Int = 7
        if DrUWYpAhc > 7 {
            if DrUWYpAhc < 7 {
                DrUWYpAhc = 7
    }

  }
}
  
        if let canvasScene = controller.canvasPixelView?.canvasScene, let canvasView = controller.canvasPixelView {
            if pixelSize == nil {
                let pixelHeight = (sender.view?.frame.height ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForHeight_vatr() ?? 1))
                let pixelWidth = (sender.view?.frame.width ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr() ?? 1))
                pixelSize = min(pixelHeight, pixelWidth)
            }

            // Calculate correct location in terms of canvas and corresponding pixels.
            let touchLocation = sender.location(in: sender.view)
            let touchLocationInScene = canvasView.convert(touchLocation, to: canvasScene)

            var nodes = canvasScene.nodes(at: touchLocationInScene)
            
            // prevent unnessasery redraw
            if let basePixel = nodes.compactMap({ $0 as? Pixel_vatr}).first {
                if basePixel == previusBasePixel {
                    return
                }
                previusBasePixel = basePixel
            }
            
            let pixelRange = self.getPixelRange(brushSize: controller.brashSize)
            for widthIdx in pixelRange {
                for heightIdx in pixelRange {
                    nodes.append(contentsOf: canvasScene.nodes(at: canvasView.convert(.init(x: touchLocation.x + pixelSize!*CGFloat(widthIdx), y: touchLocation.y + pixelSize!*CGFloat(heightIdx)), to: canvasScene)))
                }
            }
            
            // Get the tapped pixel.
            let pixels: [Pixel_vatr] = nodes.compactMap({$0 as? Pixel_vatr})
            
            
            pixels.forEach { pxl in
                let noiseValue = getNoiseVal_vatr(from: controller)
                let randomNoiseValue = CGFloat.random(in: noiseValue...0.95)
                let noiseCurrentDrawingColor = controller.currentDrawingColor.withLuminosity_erfe(randomNoiseValue)
                let drawCommand = DrawCommand_vatr(oldColor: pxl.fillColor,
                                              newColor: noiseCurrentDrawingColor,
                                              pixels: [pxl])

                // Append the pixel to the current groupDrawCommand so it can be executed later.
                controller.commandManager.execute(drawCommand)
            }
        }
    }
    
    func handleDrawFrom_vatr(_ sender: UIPanGestureRecognizer, _ controller: SkinCreatorViewController_vatr) {
func vmxrIGLC() {
        var DixNcoJALM: Int = 7
        if DixNcoJALM > 7 {
            if DixNcoJALM < 7 {
                DixNcoJALM = 7
    }

  }
}
  
        // Initialise group draw command and tear down when needed.
        switch sender.state {
        case .began:
            controller.groupDrawCommand = GroupDrawCommand_vatr()
        case .ended:
            break
//            controller.commandManager.execute(controller.groupDrawCommand)
        default:
            break
        }

        if let canvasScene = controller.canvasPixelView?.canvasScene, let canvasView = controller.canvasPixelView {
            
            if pixelSize == nil {
                let pixelHeight = (sender.view?.frame.height ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForHeight_vatr() ?? 1))
                let pixelWidth = (sender.view?.frame.width ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr() ?? 1))
                pixelSize = min(pixelHeight, pixelWidth)
            }

            // Calculate correct location in terms of canvas and corresponding pixels.
            let touchLocation = sender.location(in: sender.view)
            let touchLocationInScene = canvasView.convert(touchLocation, to: canvasScene)

            var nodes = canvasScene.nodes(at: touchLocationInScene)
            
            
            // prevent unnessasery redraw
            if let basePixel = nodes.compactMap({ $0 as? Pixel_vatr}).first {
                if basePixel == previusBasePixel {
                    return
                }
                previusBasePixel = basePixel
            }
            
            let pixelRange = self.getPixelRange(brushSize: controller.brashSize)
            for widthIdx in pixelRange {
                for heightIdx in pixelRange {
                    nodes.append(contentsOf: canvasScene.nodes(at: canvasView.convert(.init(x: touchLocation.x + pixelSize!*CGFloat(widthIdx), y: touchLocation.y + pixelSize!*CGFloat(heightIdx)), to: canvasScene)))
                }
            }
            
            // Get the tapped pixel.
            let pixels: [Pixel_vatr] = nodes.compactMap({$0 as? Pixel_vatr})
            
            
            pixels.forEach { pxl in
                let noiseValue = getNoiseVal_vatr(from: controller)
                let randomNoiseValue = CGFloat.random(in: noiseValue...0.95)
                let noiseCurrentDrawingColor = controller.currentDrawingColor.withLuminosity_erfe(randomNoiseValue)
                let drawCommand = DrawCommand_vatr(oldColor: pxl.fillColor,
                                              newColor: noiseCurrentDrawingColor,
                                              pixels: [pxl])

                // Append the pixel to the current groupDrawCommand so it can be executed later.
                controller.groupDrawCommand.appendAndExecuteSingle_vatr2(drawCommand)
            }

            // Get the touched pixel.
//            nodes.forEach({ (node) in
//                if let pixel = node as? Pixel {
//                    let noiseValue = 0.95 - 0.4
//                    let randomNoiseValue = CGFloat.random(in: noiseValue...0.95)
//                    let noiseCurrentDrawingColor = controller.currentDrawingColor.withLuminosity(randomNoiseValue)
//                    let drawCommand = DrawCommand(oldColor: pixel.fillColor,
//                                                  newColor: noiseCurrentDrawingColor,
//                                                  pixels: [pixel])
//
//                    // Append the pixel to the current groupDrawCommand so it can be executed later.
//                    controller.groupDrawCommand.appendAndExecuteSingle(drawCommand)
//                }
//            })
        }
    }
    
    private func getNoiseVal_vatr(from controller: SkinCreatorViewController_vatr) -> CGFloat {
        var noiseVariativity = CGFloat(controller.noiseSlider.value)
        if noiseVariativity < 0 { noiseVariativity = 0 }
        if noiseVariativity > 0.94 { noiseVariativity = 0.93 }
        
        return 0.95 - noiseVariativity
    }
}
