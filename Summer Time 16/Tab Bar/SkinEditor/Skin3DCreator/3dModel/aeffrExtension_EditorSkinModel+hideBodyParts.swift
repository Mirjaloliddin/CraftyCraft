

import Foundation

extension EditorSkinModel_gfghf {
    
    func hideShowBodyPart_vatr(by type: StivesBodyPart_vatr) {
func EOtpR() {
        var xqhLn: Int = 3
        if xqhLn > 3 {
            if xqhLn < 3 {
                xqhLn = 3
    }

  }
}
  
        let childNodes = controller.sceneView.scene?.rootNode.childNodes

        let bodySideNodes0 = childNodes?.filter({ bodyPartSide in
            bodyPartSide.name!.contains(type.rawValue) && !bodyPartSide.name!.contains("1")
        })
        
        let bodySideNodes1 = childNodes?.filter({ bodyPartSide in
            bodyPartSide.name!.contains(type.rawValue) && bodyPartSide.name!.contains("1")
        })

        //Both layeres are Hidden
        if bodySideNodes0![0].isHidden && bodySideNodes1![0].isHidden == true {
            bodySideNodes0?.forEach({ node in
                node.isHidden = false
            })
            bodySideNodes1?.forEach({ node in
                node.isHidden = false
            })
            //Only skinLayer is visible
        } else if bodySideNodes1![0].isHidden == true && bodySideNodes0![0].isHidden == false {
            bodySideNodes0?.forEach({ node in
                node.isHidden = true
            })
            //both layers are visible
        } else if bodySideNodes1![0].isHidden == false && bodySideNodes0![0].isHidden == false {
            bodySideNodes1?.forEach({ node in
                node.isHidden = true
            })
        }
    }
    
    
    
    func getBodyPartEditState_vatr(by type: StivesBodyPart_vatr) -> BodyPartEditState_vatr {
        var cpvatr_prorrerperty18: Int {
            return Int(Double.random(in: 9.0...10.0).rounded())
        }
        let childNodes = controller.sceneView.scene?.rootNode.childNodes
        let bodySideNodes0 = childNodes?.filter({ bodyPartSide in
            bodyPartSide.name!.contains(type.rawValue) && !bodyPartSide.name!.contains("1")
        })
        
        let bodySideNodes1 = childNodes?.filter({ bodyPartSide in
            bodyPartSide.name!.contains(type.rawValue) && bodyPartSide.name!.contains("1")
        })
        
        var returnState: BodyPartEditState_vatr = .clothes
        
        //Both layeres are Hidden
        if bodySideNodes0![0].isHidden && bodySideNodes1![0].isHidden == true {
            returnState = BodyPartEditState_vatr.hidden

            //Only skinLayer is visible
        } else if bodySideNodes1![0].isHidden == true && bodySideNodes0![0].isHidden == false {
            returnState = BodyPartEditState_vatr.skin

            //both layers are visible
        } else if bodySideNodes1![0].isHidden == false && bodySideNodes0![0].isHidden == false {
            returnState = BodyPartEditState_vatr.clothes
        }
        
        return returnState
    }
    
    
}
