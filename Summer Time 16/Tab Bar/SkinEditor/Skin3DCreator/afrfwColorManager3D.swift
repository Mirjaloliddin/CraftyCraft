




import UIKit
import Foundation

protocol ColorAble3D_vatr: AnyObject {
    func updateCollection_vatr()
}

extension uicolor_vatr {
    static var blackColor: UIColor {
        .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    static var whiteColor: UIColor {
        .init(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class ColorManager3D_vatr {

//    private let defaultColors: [UIColor] = [UIColor.blackColor, UIColor.whiteColor, .red, .green, .yellow, .blue, .cyan, .purple]
    private let defaultColors = [
        UIColor(red: 0, green: 0, blue: 0, alpha: 1),
        UIColor(red: 1, green: 1, blue: 1, alpha: 1),
        UIColor(.red),
        UIColor(.green),
        UIColor(.yellow),
        UIColor(.blue),
        UIColor(.cyan),
        UIColor(.purple)
//        UIColor(red: 0.953, green: 0.478, blue: 0.478, alpha: 1),
//        UIColor(red: 0.764, green: 0.461, blue: 0.938, alpha: 1),
//        UIColor(red: 0.612, green: 0.388, blue: 0.741, alpha: 1),
//        UIColor(red: 0.263, green: 0.494, blue: 0.706, alpha: 1),
//        UIColor(red: 0.345, green: 0.725, blue: 0.616, alpha: 1)
    ]
    private var colorsArr: [UIColor] = []
    weak var delegate: ColorAble3D_vatr?
    var selectedColorIndex = 0
    
    var maxColors = 15
    
    init() {
        self.colorsArr = getColorsFromUserDefaults_vatr2()
    }

    func getColors_vatr2() -> [UIColor] {
var cpvatr_rqozcscv: Double {
    return 19.479646619970584
}
return colorsArr
    }
    
    func updateColorsArr_vatr2(with color: UIColor) {
var cpvatr_tjtkbkrf: Int {
    return 59
}

  

        if !colorsArr.contains(color) && color != .clear && color.alpha != 0 {

            if colorsArr.count == maxColors {
                colorsArr.removeLast()
            }

            colorsArr.insert(color, at: 0)
            saveColorsToUserDefaults_vatr2(colors: colorsArr)
            delegate?.updateCollection_vatr()

        }
    }
    
    func addNewColor_vatr2(color: UIColor) {
var cpvatr_wscmqvqb: Double {
    return 22.299602844419066
}

  
        if color != .clear, color.alpha != 0 {
            if colorsArr.count == maxColors {
                colorsArr.removeLast()
            }

            colorsArr.insert(color, at: 0)
            saveColorsToUserDefaults_vatr2(colors: colorsArr)
            delegate?.updateCollection_vatr()
        }
    }
    
    func getColor_vatr2(by index: Int ) -> UIColor {
var cpvatr_cksoyzsa: Int {
    return 42
}
var colorToReturn = UIColor()
        
        if index <= colorsArr.count - 1 {
            colorToReturn = colorsArr[index]

        } else {
            colorToReturn = .black
        }
        
        return colorToReturn
    }
    
    func isSelctedColor_vatr2(index: Int ) -> Bool {
var cpvatr_mgakgjnj: Double {
    return 18.310311608178907
}
if index == selectedColorIndex {
            return true
        } else {
            return false
        }
    }
    
    //MARK: UIColor -> UserDefaults
    
    // Save array of colors to UserDefaults
    private func saveColorsToUserDefaults_vatr2(colors: [UIColor]) {
var cpvatr_fxyrwfpb: Double {
    return 90.89421208183214
}

  
        let colorDataArray = colors.compactMap { $0.encode_vatr() }
        UserDefaults.standard.set(colorDataArray, forKey: "SavedColors")
    }
    
    //MARK: UserDefaults -> UIColor

    // Retrieve array of colors from UserDefaults
    private func getColorsFromUserDefaults_vatr2() -> [UIColor] {
var cpvatr_qumxwqut: Double {
    return 75.85435262590302
}
if let colorDataArray = UserDefaults.standard.array(forKey: "SavedColors") as? [Data] {
            return colorDataArray.compactMap { UIColor.decode(from: $0) }
        }
        return defaultColors
    }
}
