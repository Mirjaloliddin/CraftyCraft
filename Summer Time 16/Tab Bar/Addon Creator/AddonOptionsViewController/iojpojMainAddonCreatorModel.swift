

import Foundation
import UIKit

func addNumbers132_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

class AddonCategory_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    let categoryName: String
    let imagePathName: String
    var displayImageData: Data? = nil
    
    init(title: String, imagePathName: String) {
        self.categoryName = title
        self.imagePathName = imagePathName
    }
}

struct AddonCategoryDTO_vatr: Hashable {
    let title: String
    let imagePathName: String
}

class MainAddonCreatorModel_vatr {
    
    var itemsAddons: [AddonForDisplay]
    var savedAddons: [AddonForDisplay]
    var categories: [AddonCategory_vatr]
    
    init() {
        savedAddons = RealmService_vatr.shared.getAddonEditorArray_vatr().map( { AddonForDisplay(realmModel: $0) })

        var categoriesSet: Set<AddonCategoryDTO_vatr> = []
        savedAddons.forEach {
            categoriesSet.insert(.init(title: $0.type, imagePathName: $0.categoryImage))
        }
        categories = categoriesSet.map( {AddonCategory_vatr(title: $0.title, imagePathName: $0.imagePathName) })
        categories.removeAll(where: {$0.categoryName == AddonEditorModel_vatr.K_vatr.itemKey})
        
        itemsAddons = savedAddons.filter({ $0.type == AddonEditorModel_vatr.K_vatr.itemKey})
    }
}

@objc
class AddonSkinVariant: NSObject {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var name: String = ""
    var path: String = ""
    
    init(name: String = "", path: String = "") {
        self.name = name
        self.path = path
    }
}

class AddonForDisplay {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var idshka: String = ""
    var displayName: String = ""
    var displayImage: String = ""
    var categoryImage: String = ""
    var displayImageData: Data?
    var id: String = ""
    var type: String = ""
    var file: String = ""
    
    var skin_variants: [AddonSkinVariant] = .init()
    
    var health: Float = 0
    var move_speed: Float = 0
    
    var ranged_attack_enabled: Bool = false
    var ranged_attack_atk_speed: Double = 0.0
    var ranged_attack_atk_radius: Double = 0.0
    var ranged_attack_burst_shots: Double = 0.0
    var ranged_attack_burst_interval: Double = 0.0
    var ranged_attack_atk_types: String?

    var addonLikeSkinInfo: AddonLikeSkinInfo?
    
    //newAddons
    init(realmModel: AddonsEdotorRealmSession_vatr) {
        self.idshka = realmModel.idshka
        self.displayName = realmModel.displayName
        self.displayImage = realmModel.displayImage
        self.displayImageData = realmModel.displayImageData
        self.categoryImage = realmModel.categoryImage
        self.id = realmModel.id
        self.type = realmModel.type
        self.file = realmModel.file
        
        self.skin_variants = realmModel.skin_variants.map { AddonSkinVariant(name: $0.name, path: $0.path) }
        
        self.health = realmModel.health
        self.move_speed = realmModel.move_speed
        
        self.ranged_attack_enabled = realmModel.ranged_attack_enabled
        self.ranged_attack_atk_speed = realmModel.ranged_attack_atk_speed
        self.ranged_attack_atk_radius = realmModel.ranged_attack_atk_radius
        self.ranged_attack_burst_shots = realmModel.ranged_attack_burst_shots
        self.ranged_attack_burst_interval = realmModel.ranged_attack_burst_interval
        self.ranged_attack_atk_types = realmModel.ranged_attack_atk_types
        
        if realmModel.addonLikeSkinInfo != nil {
            let colors: [UIColor] = realmModel.addonLikeSkinInfo!.skinColorArray.map { UIColor.init(red: CGFloat($0.red),
                                                   green: CGFloat($0.green),
                                                   blue: CGFloat($0.blue),
                                                   alpha: CGFloat($0.alpha))}
            addonLikeSkinInfo = .init(colorArray: colors,
                                      height: realmModel.addonLikeSkinInfo!.height,
                                      width: realmModel.addonLikeSkinInfo!.width)
        }
    }
}
