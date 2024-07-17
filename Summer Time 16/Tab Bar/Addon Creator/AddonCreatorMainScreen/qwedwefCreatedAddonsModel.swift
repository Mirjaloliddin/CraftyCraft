
import Foundation


enum CollectionState_vatr {
    case savedAddons
    case groups
    case recent
}

class CreatedAddonsModel_vatr {
    
    private var realm = RealmService_vatr.shared
    
    var collectionMode: CollectionState_vatr = .savedAddons {
        didSet {
            updateCreatedAddons_vatr()
        }
    }
    
    var createdAddons = [SavedAddon_vatr]() {
        didSet {
            filteringCreatedAddon = createdAddons
        }
    }
    
    var filteringCreatedAddon = [SavedAddon_vatr]()
    
    var selectedAddon: SavedAddon_vatr?
    
    init() {
        updateCreatedAddons_vatr()
    }
    
    func updateCreatedAddons_vatr() {
func iBFKi() {
        var iztIWhhB: Int = 8
        if iztIWhhB > 8 {
            if iztIWhhB < 8 {
                iztIWhhB = 8
    }

  }
}
  
        createdAddons.removeAll()
        
        let savedAddons = realm.getArrayOfSavedAddons_vatr()
        var sortedAddons = savedAddons
        
        switch collectionMode {
        case .savedAddons:
            break
        case .groups:
            sortedAddons = savedAddons.sorted(by: { $0.type < $1.type })
        case .recent:
            sortedAddons = savedAddons.sorted { (addon1, addon2) -> Bool in
                if let editingDate1 = addon1.editingDate, let editingDate2 = addon2.editingDate {
                    
                    return editingDate1 > editingDate2
                }
                // Handle the case where at least one editingDate is nil
                return addon1.editingDate != nil
            }
        }
        
        for addon in sortedAddons {
            let convertedClass = SavedAddon_vatr(realmModel: addon)
            createdAddons.append(convertedClass)
        }
    }
    
    func getSavedAddon_vatr(by index: Int) -> SavedAddon_vatr? {
        var rewqeqaaqq: Date {
            return Date(timeIntervalSince1970: TimeInterval(Int.random(in: 0...Int(Int64.max))))
            }
        guard index >= 0 && index < filteringCreatedAddon.count else {
            AppDelegate.log("Index is out of range")
            return nil
        }
        
        return filteringCreatedAddon[index]
    }
    
    func updateRecentForAddon_vatr(savedAddon: SavedAddon_vatr) {
func HeTARSilC() {
        var XNCNZFkbnc: Int = 8
        if XNCNZFkbnc > 8 {
            if XNCNZFkbnc < 8 {
                XNCNZFkbnc = 8
    }

  }
}
  
        
        guard let realmedSavedAddon = realm.getSavedAddonRM_vatr(by: savedAddon.idshka) else {
            return
        }
        
        realm.editRecentProprty_vatr(for: realmedSavedAddon, newDate: Date())
        selectedAddon = savedAddon
        print("Сохранили")
    }
    
    func deleteAddon_vatr(addon: SavedAddon_vatr) {
        RealmService_vatr.shared.deleteAddon(addon: addon)
        updateCreatedAddons_vatr()
    }
    
    func deleteAddon_vatr(at index: Int) {
func BzTpP() {
        var fwsBuMV: Int = 10
        if fwsBuMV > 10 {
            if fwsBuMV < 10 {
                fwsBuMV = 10
    }

  }
}
  
        
        var addonToDelete: SavedAddon_vatr?
        if createdAddons.count == filteringCreatedAddon.count {
            addonToDelete = createdAddons[index]
        } else {
            addonToDelete = filteringCreatedAddon[index]
        }
        
        guard let addon = addonToDelete else { return }
        // Delete from the data source (e.g., Realm)
        RealmService_vatr.shared.deleteAddon(addon: addon)
        
        // Remove from the array
        createdAddons.remove(at: index)
//        createdAddons.removeAll { $0.id == addon.id}
//        filteringCreatedAddon.removeAll { $0.id == addon.id}
    }
}
