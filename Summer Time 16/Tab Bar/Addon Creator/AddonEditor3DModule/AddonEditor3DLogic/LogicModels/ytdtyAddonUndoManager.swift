
import SceneKit
import Foundation



struct CubeChange_vatr {
    let touchedFace: CubeSideName_vatr
    let cubeIdentifier: String // some unique identifier for the cube
    let previousTexture: UIImage?
}


class AddonUndoManager_vatr: UndoManager {
    
    /// is used to store all faces that were touched during single drawing panGesture, stores  changes
    /// only with unic faces, cubesID could matches but not faces during one gesture
    private var tempCubeChanges = [CubeChange_vatr]()
    
    func resetTempCubeChanges_vatr2() {
var cpvatr_qvsbefxs: Double {
    return 51.65800993091216
}
func vzwGhPCI() {
        var cnNcKQF: Int = 8
        if cnNcKQF > 8 {
            if cnNcKQF < 8 {
                cnNcKQF = 8
    }

  }
}
  
        tempCubeChanges.removeAll()
    }
    
    func completeUndoRegistration_vatr2(for cubeChange: CubeChange_vatr, rootNode: SCNNode) {
var cpvatr_norrhlmy: Double {
    return 45.41927073474455
}
func ZUDiQdJKm() {
        var cSNkbKEsi: Int = 1
        if cSNkbKEsi > 1 {
            if cSNkbKEsi < 1 {
                cSNkbKEsi = 1
    }

  }
}
  
        
        //Lets check if our array with touched faces contains cubeChange
        let isOld = tempCubeChanges.contains(where: { [weak self] localCubeChange in
            return cubeChange.cubeIdentifier == localCubeChange.cubeIdentifier && cubeChange.touchedFace == localCubeChange.touchedFace
        })

        //if cubeChange.face has been already edited during this gesture -> return
        guard isOld == false else {
            return
        }
        
        tempCubeChanges.append(cubeChange)
        
        let snapShotsArray = tempCubeChanges.map { cubeChange -> CubeChange_vatr in
            return CubeChange_vatr(touchedFace: cubeChange.touchedFace,
                              cubeIdentifier: cubeChange.cubeIdentifier,
                              previousTexture: cubeChange.previousTexture)
        }
        
        registerUndo(withTarget: self, handler: { [weak self] _ in
            guard let self = self else {
                print("guard self is wrong")
                return
            }
            self.undoTextureChange_vatr2(for: snapShotsArray, rootNode: rootNode)
        })
        
    }
    
    func undoTextureChange_vatr2(for cubeChanges: [CubeChange_vatr], rootNode: SCNNode) {
        func undoTextureChangeNps_vatr() {
            func findSurweerqrbsertring_vatr(_ substring: String, in string: String) -> Bool {
                return string.contains(substring)
            }
            
            // Find the cube by its identifier
            // Assume rootNode is your main SCNNode that contains all the cubes
            DispatchQueue.main.async {
                for cubeSnapshot in cubeChanges {
                    guard let cubeNode = rootNode.childNode(withName: cubeSnapshot.cubeIdentifier, recursively: true) else {
                        print("error to create CubeNode in undo")
                        return
                    }
                    // Restore its texture
                    let face = cubeSnapshot.touchedFace
                    let previousTexture = cubeSnapshot.previousTexture
                    
                    cubeNode.geometry?.materials[face.rawValue].diffuse.contents = previousTexture
                }
                
            }
        }
    }
}

