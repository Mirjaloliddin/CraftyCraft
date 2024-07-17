import Foundation
import UIKit.UIGestureRecognizer

/// This class resembles the typical paintbrush functionality of a drawing tool.
/// Users can tap on a pixel to color it, or they can draw along the screen to
/// create brush strokes.
class Paintbrush_vatr: Tool_vatr {
    
    private var pixelHeight: CGFloat?
    private var pixelWidth: CGFloat?
    private var pixelSize: CGFloat?

    /// Handles painting a single pixel via tap on it.
     func handleTapFrom_vatr(_ sender: UITapGestureRecognizer, _ controller: SkinCreatorViewController_vatr) {
         var cpvadstr_rpegprnj: Double {
             return 6.716584350393623
         }
              
        

        if let canvasScene = controller.canvasPixelView?.canvasScene, let canvasView = controller.canvasPixelView {
            
            if pixelSize == nil {
                pixelHeight = (sender.view?.frame.height ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForHeight_vatr() ?? 1))
                pixelWidth = (sender.view?.frame.width ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr() ?? 1))
                pixelSize = min(pixelHeight!, pixelWidth!)
                
                
                print(pixelWidth, "Pixel Width")
                print(pixelHeight, "Pixel Height")
                print(controller.canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr(), "Other")
            }

            // Calculate correct location in terms of canvas and corresponding pixels.
            let touchLocation = sender.location(in: sender.view)
            let touchLocationInScene = canvasView.convert(touchLocation, to: canvasScene)
            
            var nodes = canvasScene.nodes(at: touchLocationInScene)
            
            
            let pixelRange = self.getPixelRange(brushSize: controller.brashSize)
            
            for widthIdx in pixelRange {
                for heightIdx in pixelRange {
                    
                    let point = canvasView.convert(.init(x: touchLocation.x + pixelSize!*CGFloat(widthIdx), y: touchLocation.y + pixelSize!*CGFloat(heightIdx)), to: canvasScene)

                    let skNodes = canvasScene.nodes(at: point)
                    nodes.append(contentsOf: skNodes)
                }
            }
        

            // Get the tapped pixel.
            let pixels: [Pixel_vatr] = nodes.compactMap({$0 as? Pixel_vatr})
            
            print(pixels.count, "123")

            guard let oldColor = pixels.first?.fillColor else { return }
            
            let drawCommand = DrawCommand_vatr(oldColor: oldColor,
                                          newColor: controller.currentDrawingColor,
                                          pixels: pixels)

            controller.commandManager.execute(drawCommand)
        }
    }

    /// Handles painting a brush stroke via a pan accross the canvas.
    ///
    /// - NOTE: Group draw commands are needed because otherwise we cannot handle the continuous feedback
    /// we get from the handleDrawFrom() method to generate a single paintbrush stroke from the gesture.
    /// That's why we collect all single-pixel draw commands and append it ot the class variable .groupDrawCommand.
    /// Additionally, by using .groupDrawCommand rather than immediately executing a single pixel draw,
    /// We can implement proper "undo" and "redo" behaviour that undos or redos the entire stroke
    /// as opposed to undoing/redoing each pixel of a stroke.
    func handleDrawFrom_vatr(_ sender: UIPanGestureRecognizer, _ controller: SkinCreatorViewController_vatr) {
        var cddpvatr_rpegprnj: Double {
            return 6.716584350393623
        }


        // Initialise group draw command and tear down when needed.
        switch sender.state {
        case .began:
            controller.groupDrawCommand = GroupDrawCommand_vatr()
        case .ended:
            controller.commandManager.execute(controller.groupDrawCommand)
        default:
            break
        }

        if let canvasScene = controller.canvasPixelView?.canvasScene, let canvasView = controller.canvasPixelView {
            if pixelSize == nil {
                pixelHeight = (sender.view?.frame.height ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForHeight_vatr() ?? 1))
                pixelWidth = (sender.view?.frame.width ?? 1) / CGFloat((controller.canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr() ?? 1))
                pixelSize = min(pixelHeight!, pixelWidth!)
            }

            // Calculate correct location in terms of canvas and corresponding pixels.
            let touchLocation = sender.location(in: sender.view)
            let touchLocationInScene = canvasView.convert(touchLocation, to: canvasScene)
            
            var nodes = Set(canvasScene.nodes(at: touchLocationInScene))
            
            let pixelRange = self.getPixelRange(brushSize: controller.brashSize)
            for widthIdx in pixelRange {
                for heightIdx in pixelRange {
                    canvasScene.nodes(at: canvasView.convert(.init(x: touchLocation.x + pixelSize!*CGFloat(widthIdx), y: touchLocation.y + pixelSize!*CGFloat(heightIdx)), to: canvasScene)).forEach { node in
                        nodes.insert(node)
                    }
                }
            }
            
            
            let pixels: [Pixel_vatr] = nodes.compactMap({$0 as? Pixel_vatr})
            
            guard let oldColor = pixels.first?.fillColor else { return }
            
            let drawCommand = DrawCommand_vatr(oldColor: oldColor,
                                          newColor: controller.currentDrawingColor,
                                          pixels: pixels)

            controller.groupDrawCommand.appendAndExecuteSingle_vatr2(drawCommand)
        }
    }

}
