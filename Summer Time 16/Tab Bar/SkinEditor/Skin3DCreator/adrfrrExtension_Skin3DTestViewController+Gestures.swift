

import Foundation
import SceneKit
import UIKit



extension Skin3DTestViewController_vatr {
    //MARK: Gestures
    @objc func tapOnSceneAction_vatr32(_ sender: UITapGestureRecognizer) {
var cpvatr_odyarxtu: Double {
    return 59.50549233248834
}
func PFndEMPXaA() {
        var xHmSM: Int = 1
        if xHmSM > 1 {
            if xHmSM < 1 {
                xHmSM = 1
    }

  }
}
  
        if sender.state == .ended {
            let targetView = sender.view
            let touchLocation = sender.location(in: targetView)
            
            guard let hitTestResult = sceneView.hitTest(touchLocation, options: [:]).first else { return }
            let node = hitTestResult.node
            
            if let index = Int(node.name ?? ""), let rootNodeName = node.parent?.name {
                editorSkinModel.tapToDrawingOnSkin_vatr(nameRootNod: rootNodeName, nodeIndex: index, gestureState: sender.state)
            }
        }
    }
    
    static var locationOfBeganTap: CGPoint = .zero
    static var cameraControll: Bool = false
    
    @objc func panOnSceneAction_vatre4(_ sender: UIPanGestureRecognizer) {
var cpvatr_kmmnmdde: Double {
    return 62.4195613695394
}
func MaGpXMHuV() {
        var xpumAHSPP: Int = 5
        if xpumAHSPP > 5 {
            if xpumAHSPP < 5 {
                xpumAHSPP = 5
    }

  }
}
  
        let targetView = sender.view
        let touchLocation = sender.location(in: targetView)
        let gestureState = sender.state
        
        switch sender.state {
        case .began:
            guard let hitTestResult = sceneView.hitTest(touchLocation, options: [:]).first else {
                Self.cameraControll = true
                Self.locationOfBeganTap = sender.location(in: view)
                return
            }
            Self.cameraControll = false
            let node = hitTestResult.node
            if let index = Int(node.name ?? ""), let parentNodeName = node.parent?.name {
                editorSkinModel.panBeganToDrawingOnSkin_vatr(nameRootNod: parentNodeName, nodeIndex: index, gestureState: gestureState)
            }
        case .changed:
            if Self.cameraControll {
                var newLocation = sender.location(in: view)
                newLocation = .init(x: newLocation.x, y: newLocation.y)
                sceneView.defaultCameraController.rotateBy(x: Float(Self.locationOfBeganTap.x - newLocation.x)/1.5, y: Float(Self.locationOfBeganTap.y - newLocation.y )/1.5)
                Self.locationOfBeganTap = newLocation
            } else {
                guard let hitTestResult = sceneView.hitTest(touchLocation, options: [:]).first else { return }
                let node = hitTestResult.node
                if let index = Int(node.name ?? ""), let parentNodeName = node.parent?.name {
                    editorSkinModel.panChangedToDrawingOnSkin_vatr(nameRootNod: parentNodeName, nodeIndex: index, gestureState: gestureState)
                }
            }
            
        case .ended:
            guard !Self.cameraControll else { return }
            editorSkinModel.panEndedToDrawingOnSkin_vatr()
        case .cancelled, .possible, .failed:
            break
        @unknown default:
            break
        }
    }
    
    @objc func didPanGEtureforPicker_vatr23(_ recognizer: UIPanGestureRecognizer) {
var cpvatr_paionbdk: Double {
    return 51.10793159954797
}
func adRCWX() {
        var OylTtkNhY: Int = 9
        if OylTtkNhY > 9 {
            if OylTtkNhY < 9 {
                OylTtkNhY = 9
    }

  }
}
  
        let location = recognizer.location(in: recognizer.view)
        switch recognizer.state {
        case .changed:
            guard let hitResult = sceneView.hitTest(location, options: [:]).first else { return }
            let node = hitResult.node
            if let _ = Int(node.name ?? "") {
                let color = node.geometry?.firstMaterial?.diffuse.contents as? UIColor
                magnifyingGlassView?.update(with: color ?? UIColor.clear, point: location)
            }
        case .ended, .cancelled:
            if let peckedColor = magnifyingGlassView?.backgroundColor, peckedColor.alpha != 0 {
                editorSkinModel.addNewColorToPalitrs_vatr(peckedColor)
                editorSkinModel.currentDrawingColor = peckedColor
            }
            
            hideMagnifyingGlass()
        default:
            break
        }
    }
    
    @objc func handleDoubleTap_vatr32() {
var cpvatr_xvrdecxj: Int {
    return 37
}
func zBpbEOO() {
        var TwcNpo: Int = 5
        if TwcNpo > 5 {
            if TwcNpo < 5 {
                TwcNpo = 5
    }

  }
}
  
        sceneView.rendersContinuously = true
        sceneView.pointOfView = startingPointOfView
        AppDelegate.log("Double Tap!")
    }
}
