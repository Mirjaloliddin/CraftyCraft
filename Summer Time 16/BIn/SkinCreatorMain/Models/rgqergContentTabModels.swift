

import UIKit

// MARK: - Enums

enum TabsPageController_dfgdgf: Int {
    case skins = 0
    case maps = 1
    case addons = 2
    
    var name: String {
        switch self {
        case .skins:
            return "Skins"
        case .maps:
            return "Maps"
        case .addons:
            return "Addons"
        }
    }
}

enum SegmentedController_vfdj {
    case latest
    case popular
    case filter(String)
}

struct TabPagesCollectionCellModel_fgdgh {
    let id: String
    let name: String
    let image: String
    let isContentNew: Bool
    let description: String?
    let isFavorite: Bool
    var imageData: Data?
    let filterCategory: String
    let file: String?
}

struct TableCellData_vatr {
    let name: String
    let imageName: String
    var isSelected: Bool
}

extension TableCellData_vatr: Equatable {
    static func == (lhs: TableCellData_vatr, rhs: TableCellData_vatr) -> Bool {
        lhs.name == rhs.name && lhs.imageName == rhs.imageName && lhs.isSelected == rhs.isSelected
    }
}
