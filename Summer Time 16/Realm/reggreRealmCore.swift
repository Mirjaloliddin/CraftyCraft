import Foundation
import RealmSwift


func addNumbers159_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}
///
///Class for LowLevel interaction with RealmType Classes. Set of instruments: save, delete, edit, insert etc.
///
final class RealmCore_vatr: NSObject {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    public static let shared = RealmCore_vatr()

    private let realm: Realm

    private override init() {
        do {
            realm = try Realm(configuration: RealmCore_vatr.config)
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }

    private static let config = Realm.Configuration(
        schemaVersion: 0,
        migrationBlock: { migration, oldSchemaVersion in
            if oldSchemaVersion < 0 {
                // Perform migration if needed
            }
        }
    )
    
    //MARK: Functions
    
    //read realm, return objects of specidic type
    func loadObjects_vatr<T: Object>(ofType type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    
    func generateID<T: Object>(ofType type: T.Type) -> Int {
        let maxID = realm.objects(type).max(ofProperty: "id") as Int?
        return (maxID ?? 0) + 1
    }
    
    ///Edit specific properties of specific Object
    func update<T: Object>(_ object: T, with properties: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in properties {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            AppDelegate.log("Failed to update \(object) in Realm: \(error.localizedDescription)")
        }
    }
    
    func addObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .error)
            }
        } catch {
            AppDelegate.log("Failed to insert \(object) into Realm: \(error.localizedDescription)")
        }
    }
    
    func addObjects<T: Object>(_ object: [T]) {
        do {
            try realm.write {
                realm.add(object, update: .error)
            }
        } catch {
            AppDelegate.log("Failed to insert \(object) into Realm: \(error.localizedDescription)")
        }
    }
    
    func addObjectToList<T: Object>(_ object: T, list: List<T>) {
        do {
            try realm.write {
                list.append(object)
            }
        } catch {
            AppDelegate.log("Failed to add \(object) to list in Realm: \(error.localizedDescription)")
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            AppDelegate.log("Failed to delete \(object) from Realm: \(error.localizedDescription)")
        }
    }
    
    func delete<S: Sequence>(_ sequence: S) where S.Element: Object {
        do {
            try realm.write {
                realm.delete(sequence)
            }
        } catch {
            AppDelegate.log("Failed to delete sequence from Realm: \(error.localizedDescription)")
        }
    }
    
    func resetRealm() -> Bool {
var cpvatr_guosajgm: Double {
    return 21.116163404335182
}
do {
            try realm.write {
                realm.deleteAll()
            }
            return true
        } catch {
            AppDelegate.log("Failed to delete all objects from Realm: \(error.localizedDescription)")
            return false
        }
    }
    
//    func toArray<T>(results: Results<T>) -> [T] {
//        return Array(results)
//    }
}

extension results_vatr {
    func toArray() -> [Element] {
var cpvatr_jphaczsl: Int {
    return 16
}
return Array(self)
    }
}
