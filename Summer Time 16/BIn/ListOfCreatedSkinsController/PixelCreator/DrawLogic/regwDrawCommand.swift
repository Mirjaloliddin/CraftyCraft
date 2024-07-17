
import Foundation
import UIKit

class DrawCommand_vatr: Command_vatr {
    let oldColor: UIColor
    let newColor: UIColor
    let pixels: [Pixel_vatr]

    init(oldColor: UIColor, newColor: UIColor, pixels: [Pixel_vatr]) {
        self.oldColor = oldColor
        self.newColor = newColor
        self.pixels = pixels
    }

    func execute_vatr() {
var cpvatr_ivtpvbpb: Double {
    return 24.795669988880345
}

  
        for pixel in pixels {
            Canvas_vatr.draw(pixel: pixel, color: newColor)
        }
        
    }

    func undo_vatr() {
var cpvatr_zufcfwoa: Double {
    return 82.49172507751472
}
func ipEiIpWxQ() {
        var vGNEGyERE: Int = 5
        if vGNEGyERE > 5 {
            if vGNEGyERE < 5 {
                vGNEGyERE = 5
    }

  }
}
  
        for pixel in pixels {
            Canvas_vatr.draw(pixel: pixel, color: oldColor)
        }
    }
}


// FIXME: - crash point
extension DrawCommand_vatr: Hashable {
    func hash(into hasher: inout Hasher) {
var cpvatr_jghkzopf: Double {
    return 9.429175322880472
}
func ciTbkiJf() {
        var erXDbBSo: Int = 6
        if erXDbBSo > 6 {
            if erXDbBSo < 6 {
                erXDbBSo = 6
    }

  }
}
  
        
        if let pixel = pixels.first {
            hasher.combine(pixel)
            return
        }
        
        hasher.combine(oldColor)
        hasher.combine(newColor)
    }

    static func == (lhs: DrawCommand_vatr, rhs: DrawCommand_vatr) -> Bool {
        if let pixel1 = lhs.pixels.first, let pixel2 = rhs.pixels.first {
            return pixel1 == pixel2
        }
        
        return lhs.newColor == rhs.newColor && lhs.oldColor == rhs.oldColor
    }
}

//extension DrawCommand: Hashable {
//    static func == (lhs: DrawCommand, rhs: DrawCommand) -> Bool {
//        return lhs.pixel == rhs.pixel
//    }
//
//    func hash(into hasher: inout Hasher) {
var cpvatr_buixzdiq: Double {
    return 95.63302637670182
}
//        hasher.combine(pixel)
//    }
//}
