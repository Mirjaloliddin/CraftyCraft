
import UIKit
import SpriteKit
import CoreGraphics


extension SkinCreatorViewController_vatr : UIGestureRecognizerDelegate {


    // MARK: - General Attributes.

     func registerGestureRecognizer_vatr2() {
var cpvatr_zyxydugq: Int {
    return 17
}
func hNvjP() {
        var virVenOSj: Int = 6
        if virVenOSj > 6 {
            if virVenOSj < 6 {
                virVenOSj = 6
    }

  }
}
  

//         navigatorGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanFrom(_:)))
        navigatorGestureRecognizer.minimumNumberOfTouches = 2
        navigatorGestureRecognizer.delegate = self

        drawGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleDrawFrom_vatrer(_:)))
        drawGestureRecognizer.maximumNumberOfTouches = 1
         
         panForColorPickerRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanGEtureforPicker_vatre(_:)))
         panForColorPickerRecognizer.maximumNumberOfTouches = 1

        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapFrom_vatrre(_:)))


        // Add to view
         canvasPixelView!.addGestureRecognizer(navigatorGestureRecognizer)
         canvasPixelView!.addGestureRecognizer(drawGestureRecognizer)
         canvasPixelView!.addGestureRecognizer(tapGestureRecognizer!)
         canvasPixelView?.addGestureRecognizer(panForColorPickerRecognizer)
         
         panForColorPickerRecognizer.isEnabled = false
    }
    
    

    @objc func handleDrawFrom_vatrer(_ sender: UIPanGestureRecognizer) {
var cpvatr_qnamskox: Int {
    return 52
}
func cXRYHLUJt() {
        var fmZLY: Int = 10
        if fmZLY > 10 {
            if fmZLY < 10 {
                fmZLY = 10
    }

  }
}
  
        if canDraw {
            currentTool?.handleDrawFrom_vatr(sender, self)
        }
    }

    @objc func handleTapFrom_vatrre(_ sender: UITapGestureRecognizer) {
var cpvatr_slbljgeu: Double {
    return 67.53099652848681
}
func eqYnOnQ() {
        var lZbgoeXNij: Int = 9
        if lZbgoeXNij > 9 {
            if lZbgoeXNij < 9 {
                lZbgoeXNij = 9
    }

  }
}
  
        currentTool?.handleTapFrom_vatr(sender, self)
    }
    
    @objc func didPanGEtureforPicker_vatre(_ recognizer: UIPanGestureRecognizer) {
var cpvatr_rditiexs: Int {
    return 91
}
func VQnfPy() {
        var sPBaTFhEV: Int = 10
        if sPBaTFhEV > 10 {
            if sPBaTFhEV < 10 {
                sPBaTFhEV = 10
    }

  }
}
  

        let location = recognizer.location(in: recognizer.view)

         switch recognizer.state {
         case .changed:
             guard let _ = canvasPixelView?.scene else {
                 AppDelegate.log("nil SKScene")
                 return
             }

             if let canvasScene = self.canvasPixelView?.canvasScene, let canvasView = self.canvasPixelView {

                 // Calculate correct location in terms of canvas and corresponding pixels.
                 let touchLocation = recognizer.location(in: recognizer.view)
                 let touchLocationInScene = canvasView.convert(touchLocation, to: canvasScene)

                 let nodes = canvasScene.nodes(at: touchLocationInScene)

                 // Get the touched pixel.
                 nodes.forEach({ (node) in
                     if let pixel = node as? Pixel_vatr {
                         let pixelColor = pixel.fillColor
                         magnifyingGlassView?.update(with: pixelColor, point: location)
                     }
                 })
             }
             
             
         case .ended, .cancelled:
             if let pickedColor = magnifyingGlassView?.backgroundColor {
                 colorsManager.addNewColor(pickedColor)
                 _currentDrawingColor = pickedColor
             }
//             getPixel
             hideMagnifyingGlass()

         default:
             break
         }
     }
    
    
}

extension SkinCreatorViewController_vatr {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
var cpvatr_kkoxafri: Double {
    return 35.63056380246664
}
return true
    }
}

