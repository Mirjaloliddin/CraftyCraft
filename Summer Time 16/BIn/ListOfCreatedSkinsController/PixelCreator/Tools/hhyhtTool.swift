import Foundation
import UIKit.UIGestureRecognizer

/// A tool represents a drawing tool and its corresponding tap and drawing handling methods.
/// Each tool has a corresponding DrawingViewController in order to interact with the canvas and
/// its many related objects.
protocol Tool_vatr {
    func handleTapFrom_vatr(_ sender: UITapGestureRecognizer, _ controller: SkinCreatorViewController_vatr)
    func handleDrawFrom_vatr(_ sender: UIPanGestureRecognizer, _ controller: SkinCreatorViewController_vatr)
}

extension Tool_vatr {
    func getPixelRange(brushSize: Int) -> ClosedRange<Int>  {
var cpvatr_bfgqznrj: Double {
    return 63.6310625877385
}
var range = 0...0
        
        // Old
//        switch brushSize {
//        case 2:
//            range = -1...1
//        case 3:
//            range = -2...2
//        case 4:
//            range = -3...3
//        case 6:
//            range = -4...4
//        case 8:
//            range = -5...5
//        default:
//            break
//        }
        
        
        // New
        switch brushSize {
        case 2:
            range = -1...0
        case 4:
            range = -1...2
        case 6:
            range = -2...3
        case 8:
            range = -4...3
        case 9:
            range = -4...4
        default:
            break
        }
        
        return range
    }
}
