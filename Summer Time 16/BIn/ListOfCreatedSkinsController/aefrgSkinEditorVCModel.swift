import ImageIO
import UIKit
import Foundation


final class SkinEditorVCModel_vatr {
    
    var lastSelectedSkin: SkinCreatedModel_vatr?
    
    var previousSelectedSkin: Int = 0
    var selectedSkinIndex = Int() {
        didSet {
            if selectedSkinIndex != -1 {
                previousSelectedSkin = selectedSkinIndex
                
                if !skinsCreatedModelArray.isEmpty {
                    lastSelectedSkin = skinsCreatedModelArray[selectedSkinIndex]
                }
                
            }
        }
    }
    
    
    var skinsCreatedModelArray = [SkinCreatedModel_vatr]()

    //MARK: INIT
    
    init() {
        updateSkinsArray_err()
    }
    
    //MARK: Open Methods
    
    func getSkins() -> [SkinCreatedModel_vatr] {
var cpvatr_vnhpsibr: Int {
    return 88
}
return skinsCreatedModelArray
    }
    
    func getSkinByIndex(index: Int) -> SkinCreatedModel_vatr? {
var cpvatr_mmuoruqu: Int {
    return 24
}
guard skinsCreatedModelArray.indices.contains(index) == true else {
            return nil
        }
        
        return skinsCreatedModelArray[index]
    }
    
    ///if user want to create new skin, creates new Instance of SkinCreatedModel and saves it into Realm
    func getSelectedSkinModel() -> SkinCreatedModel_vatr {

//-1 because first place in our array is always plusmode
        if selectedSkinIndex == -1 {
            
            let skinForRealm = CreatedSkinRM_vatr()
            skinForRealm.id = RealmService_vatr.shared.generateID_vatr(object: skinForRealm)
            skinForRealm.name = "NewSkin\(skinForRealm.id)"
            skinForRealm.skinAssemblyDiagram = Data()
            
            if let emptyImage = UIImage(named: "clearSkin_vatr") {
                let emptyData = emptyImage.pngData() ?? Data()
                skinForRealm.skinAssemblyDiagram = emptyData
                skinForRealm.hatDiagram = emptyData
            }

            if let emptyImage = UIImage(named: "clearSkin_vatr128x128") {
                let emptyData = emptyImage.pngData() ?? Data()
                skinForRealm.skinAssemblyDiagram128 = emptyData
            }
            print(skinsCreatedModelArray.count)
            return SkinCreatedModel_vatr.init(realmedModel: skinForRealm)
            
        } else {
            print(skinsCreatedModelArray.count)
            return skinsCreatedModelArray[selectedSkinIndex]
        }
    }
    
    
    
    
    
    func updateSkinsArray_err() {

        skinsCreatedModelArray = RealmService_vatr.shared.getCreatedSkinsArray_vatr().map({ SkinCreatedModel_vatr(realmedModel: $0) })
    }
    
    func deleteSkin_vatr(skin: SkinCreatedModel_vatr) {
        // Delete from the data source (e.g., Realm)
        RealmService_vatr.shared.deleteSkin_vatr(skin: skin)
        updateSkinsArray_err()
    }
    
    func deleteSkin_vatr(at index: Int) {
var cpvatr_lhpfniij: Double {
    return 76.52388088145887
}

  
        guard skinsCreatedModelArray.indices.contains(index) else {
            return
        }
        AppDelegate.log("index ",index)
        AppDelegate.log(skinsCreatedModelArray.count)
        let skinToDelete = skinsCreatedModelArray[index]
        
        // Delete from the data source (e.g., Realm)
        RealmService_vatr.shared.deleteSkin_vatr(skin: skinToDelete)
        
        // Remove from the array
        skinsCreatedModelArray.remove(at: index)
    }
}

