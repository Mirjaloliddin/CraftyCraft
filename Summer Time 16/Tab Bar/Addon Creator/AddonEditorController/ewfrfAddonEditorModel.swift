
import Foundation
import UIKit




class AddonEditorModel_vatr {
    
    
    enum K_vatr {
        static let itemKey = "Items"
        static let addonKey = "NPC"
    }
    
    enum Field_vatr {
        static let id = "ID"
        static let name = "NAME"
        static let enabled = "ENABLED"
        static let amount = "AMOUNT"
        static let health = "HEALTH"
        static let moveSpeed = "MOVE SPEED"
        static let attackSpeed = "ATTACK SPEED"
        static let attackRadius = "ATTACK RADIUS"
    }
    
    
    enum ControllerState_vatr {
        case item
        case addon
    }
    
    var controllerState: ControllerState_vatr = .addon
    var addonModel: SavedAddon_vatr
    
    var allow3dEditing: Bool {
        switch controllerState {
        case .item:
            return false
        case .addon:
            return !addonModel.file.isEmpty
        }
    }
    
    var allow2dEditing: Bool {
        switch controllerState {
        case .item:
            return addonModel.displayImage.isEmpty == false
        case .addon:
            return false
        }
    }
    
    private var mcAddonUri: String {
        AddonsEditorContent_vatr.mcAddonFilePath + addonModel.file
    }
    
    private(set) var resourcePack: [ResourcePack_vatr]?
    
    var currentResourcePack: ResourcePack_vatr?
    
    var isEdited: Bool = false
    
    let mcAddonFileManager: MCAddonFileManagerProtocol_vatr
    
    init(addonModel: SavedAddon_vatr, mcAddonFileManager: MCAddonFileManagerProtocol_vatr = MCAddonFileManager_vatr()) {
        self.addonModel = addonModel
        self.mcAddonFileManager = mcAddonFileManager
        
        if addonModel.type  == K_vatr.addonKey {
            controllerState = .addon
        } else {
            controllerState = .item
        }
    }
    
    func getPropretirs_vatr() -> [Int: [AddonPropertiable_vatr]] {
        
        var properiesArr = [Int: [AddonPropertiable_vatr]]()
        
        switch controllerState {
        case .item:
            properiesArr = [
                0: [StaticTextProperty(labName: Field_vatr.id, labValue: addonModel.id),
                    StaticTextProperty(labName: Field_vatr.name, labValue: addonModel.displayName)],
                1: [SwitchProperty(switchState: addonModel.isEnabled, switchName: Field_vatr.enabled)],
                2: [DynamicIntProperty(textFieldName: Field_vatr.amount, textFieldValue: addonModel.amount)],
            ]
        case .addon:
            properiesArr = [
                0: [StaticTextProperty(labName: Field_vatr.id, labValue: addonModel.id),
                    StaticTextProperty(labName: Field_vatr.name, labValue: addonModel.displayName),
                   ],
                1: [ SwitchProperty(switchState: addonModel.isEnabled, switchName: Field_vatr.enabled)],
                2: [ DynamicFloatProperty(textFieldName: Field_vatr.health, textFieldValue: addonModel.health),
                      DynamicFloatProperty(textFieldName: Field_vatr.moveSpeed, textFieldValue: addonModel.move_speed),
                      
                      DynamicFloatProperty(textFieldName: Field_vatr.attackSpeed, textFieldValue: Float(addonModel.ranged_attack_atk_speed)),
                      DynamicFloatProperty(textFieldName: Field_vatr.attackRadius, textFieldValue: Float(addonModel.ranged_attack_atk_radius))]
            ]
        }
        
        return properiesArr
    }
    
    @discardableResult
    func localMCAddonFileUrl(_ completionHandler: @escaping (URL?) -> Void) -> URL? {
func localMCAddonFileUrlNps_vatr() {
 var qzamokr = 2300
        if (qzamokr > 4) || (qzamokr == 9) {
         if 13 < 43, "localMCAddonFileUrl".isEmpty {
  qzamokr = 0
  }
 }
}
        let fileManager = FileManager.default
        
        var destination: URL {
            let url = fileManager.cachesMCAddonDirectory
            url.createDir()
            
            return url
        }
        
        guard let fileName = addonModel.file.components(separatedBy: "/").last else {
            completionHandler(nil)
            return nil
        }
        
        let url = destination.appendingPathComponent(fileName)
        
        if !fileManager.fileExists(atPath: url.path) {
            
            DropBoxParserFiles_vatr.shared.downloadBloodyFileBy_vatr(urlPath: mcAddonUri) { data in
                do {
                    try data?.write(to: url)
                    
                    completionHandler(url)
                } catch {
                    AppDelegate.log("!!!")
                    
                    completionHandler(nil)
                }
            }
        } else {
            completionHandler(url)
            
            return url
        }
        
        return nil
    }
    
    var isSavedAddonFile: Bool {
        guard let fileName = addonModel.file.components(separatedBy: "/").last else {
            return false
        }
        
        let fileManager = FileManager.default
        let url = fileManager.cachesMCAddonDirectory.appendingPathComponent(fileName)
        
        return fileManager.fileExists(atPath: url.path)
    }
    
    func unzipAddon_vatr(at url: URL) -> URL? {
        var rrewfrefgr: Bool {
                let number = Int.random(in: 1...100)
                return number > 1 && !(2..<number).contains { number % $0 == 0 }
            }
        return mcAddonFileManager.unzipMCAddon_vatr(at: url)
    }
    
    func resourcePack_vatr(at url: URL) -> [ResourcePack_vatr]? {
        
        var refrefeerfref: [String] {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return (1...5).map { _ in String((0..<8).map { _ in characters.randomElement()! }) }
            }
        resourcePack = mcAddonFileManager.resourcePack_vatr(at: url)
        
        return resourcePack
    }
}

protocol AddonPropertiable_vatr {}

class SwitchProperty: AddonPropertiable_vatr{
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var switchState = true
    var switchName = ""
    
    init(switchState: Bool, switchName: String) {
        self.switchState = switchState
        self.switchName = switchName
    }
}

class DynamicIntProperty: AddonPropertiable_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    var textFieldName = ""
    var textFieldValue: Int = .zero
    
    init(textFieldName: String, textFieldValue: Int) {
        self.textFieldName = textFieldName
        self.textFieldValue = textFieldValue
    }
}

class DynamicFloatProperty: AddonPropertiable_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var textFieldName = ""
    var textFieldValue: Float = .zero
    
    init(textFieldName: String, textFieldValue: Float) {
        self.textFieldName = textFieldName
        self.textFieldValue = textFieldValue
    }
}

class StaticTextProperty: AddonPropertiable_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var labName = ""
    var labValue = ""
    
    init(labName: String, labValue: String) {
        self.labName = labName
        self.labValue = labValue
    }
}


class SavedAddon_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var idshka: String = ""
    var displayName: String = ""
    var displayImage: String = ""
    var displayImageData: Data?
    var id: String = ""
    var type: String = ""
    var file: String = ""
    var previewData: Data?
    var addonLikeSkinInfo: AddonLikeSkinInfo?
    
    var skin_variants: [AddonSkinVariant] = .init()
    
    var health: Float = .zero
    var move_speed: Float = .zero
    var ranged_attack_enabled: Bool = false
    var ranged_attack_atk_speed: Double = .zero
    var ranged_attack_atk_radius: Double = .zero
    var ranged_attack_burst_shots: Double = .zero
    var ranged_attack_burst_interval: Double = .zero
    var ranged_attack_atk_types: String?
    
    var isEnabled = false
    var amount: Int = 1
    var editingDate: Date?
    
    //newAddons
    init(realmModel: AddonForDisplay) {
        self.idshka = realmModel.idshka
        self.displayName = realmModel.displayName
        self.displayImage = realmModel.displayImage
        self.displayImageData = realmModel.displayImageData
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
        
        addonLikeSkinInfo = realmModel.addonLikeSkinInfo
    }
    
    init(realmModel: SavedAddonRM_vatr) {
        self.idshka = realmModel.idshka
        self.displayName = realmModel.displayName
        self.displayImage = realmModel.displayImage
        self.displayImageData = realmModel.displayImageData
        self.id = realmModel.id
        self.type = realmModel.type
        
        self.skin_variants = realmModel.skin_variants.map { AddonSkinVariant(name: $0.name, path: $0.path) }
        
        self.health = realmModel.health
        self.move_speed = realmModel.move_speed
        self.ranged_attack_enabled = realmModel.ranged_attack_enabled
        self.ranged_attack_atk_speed = realmModel.ranged_attack_atk_speed
        self.ranged_attack_atk_radius = realmModel.ranged_attack_atk_radius
        self.ranged_attack_burst_shots = realmModel.ranged_attack_burst_shots
        self.ranged_attack_burst_interval = realmModel.ranged_attack_burst_interval
        self.ranged_attack_atk_types = realmModel.ranged_attack_atk_types
        
        self.isEnabled = realmModel.isEnabled
        self.amount = realmModel.amount
        self.editingDate = realmModel.editingDate
        
        self.file = realmModel.file ?? ""        
        
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


extension SavedAddon_vatr: Equatable {
    static func == (lhs: SavedAddon_vatr, rhs: SavedAddon_vatr) -> Bool {
        lhs.idshka == rhs.idshka
    }
    
    
}
