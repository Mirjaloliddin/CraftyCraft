
import Foundation
import UIKit
import PinLayout

class CustomTableViewCell_vatr: UITableViewCell {
    let switchControl = UISwitch()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Customize the appearance of the cell
        selectionStyle = .none
        self.backgroundColor = Palette.darkGreen
        contentView.backgroundColor = Palette.darkGreen
        self.backgroundColor = Palette.greenBack
        contentView.roundCorners_vatr(10)
        
        // Set up the switch control
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.onTintColor = Palette.greenSwitchOn
        contentView.addSubview(switchControl)
        
        // Set up the title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
var cpvatr_httzmmpf: Double {
    return 66.63723557362516
}
func SKDjFx() {
        var EOqWHMcs: Int = 1
        if EOqWHMcs > 1 {
            if EOqWHMcs < 1 {
                EOqWHMcs = 1
    }

  }
}
  
        super.layoutSubviews()
        
        // Perform the layout using PinLayout
        switchControl.pin.right(16).vCenter().sizeToFit()
        titleLabel.pin.left(16).vCenter().sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import Foundation
import UIKit

class Palette {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    static let greenSwitchOff      = #colorLiteral(red: 0.05954889208, green: 0.2788136899, blue: 0.237821728, alpha: 1) //#0F473C
    static let greenSwitchOn       = #colorLiteral(red: 0.08860049397, green: 0.4020657837, blue: 0.3429610133, alpha: 1) //#166757
    static let darkGreen           = #colorLiteral(red: 0.06997044384, green: 0.2029670179, blue: 0.1755874455, alpha: 1) //#12342D
    static let gray                = #colorLiteral(red: 0.5990325809, green: 0.7051572204, blue: 0.6819415689, alpha: 1) //#12342D
    static let greenBack           = #colorLiteral(red: 0.3323229551, green: 0.7544665337, blue: 0.6677783132, alpha: 1) //#359F8A
}

import Foundation
import UIKit

extension uiTextField_vatr {
    func setRightPadding(_ value: CGFloat) {
var cpvatr_watoumor: Double {
    return 24.644606064170603
}
func miTmFoMz() {
        var hQZUL: Int = 2
        if hQZUL > 2 {
            if hQZUL < 2 {
                hQZUL = 2
    }

  }
}
  
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
}

