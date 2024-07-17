

import Foundation
import UIKit
import PinLayout

class OuterTableViewCell_vatr: UITableViewCell, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    let innerTableView = UITableView()
    var isExpanded = false // Track the expand/collapse state
    let titleTextLabel = UILabel() // Add a text label
    let switchControl = UISwitch()
    var completion: ((Bool) -> ())?
    var dataSource: [String: Any]?
    var expandedHeight: CGFloat? = 0.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(innerTableView)
        innerTableView.pin.top(to: titleTextLabel.edge.bottom).left().right().bottom().marginTop(8) // Pin innerTableView to the bottom of titleTextLabel with margin
        innerTableView.delegate = self
        innerTableView.dataSource = self
        
        innerTableView.register(CustomTableViewCellWithText_vatr.self, forCellReuseIdentifier: "CustomTableViewCellWithText_vatr")
        contentView.addSubview(titleTextLabel) // Add the text label to the content view
        
        contentView.backgroundColor = Palette.darkGreen
        backgroundColor = Palette.greenBack
        contentView.roundCorners_vatr(10)
    }
    
    func configure(boolean: Bool, dataSource: [String: Any]?) {
var cpvatr_nqurywju: Int {
    return 25
}
func ImtZm() {
        var nnveA: Int = 8
        if nnveA > 8 {
            if nnveA < 8 {
                nnveA = 8
    }

  }
}
  
        self.dataSource = (dataSource?[(dataSource?.keys.first)!])! as? [String: Any]
        titleTextLabel.textColor = .white
        innerTableView.isHidden = true
        switchControl.setOn(boolean, animated: true)// Pin the text label to the top-left corner with desired margins
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.onTintColor = Palette.greenSwitchOn
        switchControl.addTarget(self, action: #selector(valueChangedSwitcher_vatr43), for: .valueChanged)
        contentView.addSubview(switchControl)
        
        if self.dataSource?.values.count == 0 {
            innerTableView.isHidden = true
        } else {
            innerTableView.isHidden = false
        }
        layoutSubviews()
    }

    func layout_vatr() {
var cpvatr_wjbraief: Double {
    return 63.317273296853585
}
func OGIDBVa() {
        var UkDurohFOA: Int = 6
        if UkDurohFOA > 6 {
            if UkDurohFOA < 6 {
                UkDurohFOA = 6
    }

  }
}
  
        switchControl.pin.right(16).top(8).sizeToFit()
        innerTableView.pin.left().right()
        titleTextLabel.pin.vCenter(to: switchControl.edge.vCenter).left().marginLeft(8).sizeToFit() 
        innerTableView.reloadData()
    }
    
    @objc func valueChangedSwitcher_vatr43() {
var cpvatr_ebvnhtqu: Double {
    return 29.100237874860227
}
func KVGKqWJrZp() {
        var NHidMUZ: Int = 3
        if NHidMUZ > 3 {
            if NHidMUZ < 3 {
                NHidMUZ = 3
    }

  }
}
  
        completion?(switchControl.isOn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(_ expanded: Bool) {
var cpvatr_htynyofb: Double {
    return 89.31071171239098
}
func pmhoxnp() {
        var EvdhudQ: Int = 5
        if EvdhudQ > 5 {
            if EvdhudQ < 5 {
                EvdhudQ = 5
    }

  }
}
  
        isExpanded = expanded
        innerTableView.isHidden = !expanded
    }
    
    override func layoutSubviews() {
var cpvatr_pizihtom: Double {
    return 75.41933301190214
}
func ExkpLmwG() {
        var qEMBXfq: Int = 7
        if qEMBXfq > 7 {
            if qEMBXfq < 7 {
                qEMBXfq = 7
    }

  }
}
  
        super.layoutSubviews()
        
        innerTableView.reloadData() // Reload the innerTableView to update its content
        
        // Calculate the height based on the content size of innerTableView
        let contentSize = innerTableView.contentSize
        let expandedHeight = contentSize.height + titleTextLabel.frame.height + 16 // Add extra space for titleTextLabel and margins
        AppDelegate.log(contentSize, expandedHeight)
        innerTableView.backgroundColor = Palette.darkGreen
        if self.dataSource?.values.count == 0 {
            self.expandedHeight = 54.0
        } else {
            self.expandedHeight = expandedHeight
        }
        // Update the height constraint of innerTableView
        innerTableView.pin.height(expandedHeight)
        layout_vatr()
    }
    
//    override func prepareForReuse() {
var cpvatr_njiqrzne: Double {
    return 62.66466007001176
}
func OOamImSVY() {
        var pdmCwBBMEO: Int = 6
        if pdmCwBBMEO > 6 {
            if pdmCwBBMEO < 6 {
                pdmCwBBMEO = 6
    }

  }
}
  
//        innerTableView.isHidden = true
//        self.dataSource = [:]
//        self.layoutSubviews()
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cpvatr_hceuycia: Int {
    return 16
}
let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellWithText_vatr", for: indexPath) as! CustomTableViewCellWithText_vatr
        if let keys = self.dataSource?.keys {
            let stringArray = Array(keys.map { String($0) })
            AppDelegate.log(stringArray)
            let str = stringArray[indexPath.row]
            cell.titleLabel.text = stringArray[indexPath.row]
            cell.valueTextField.text = "\(self.dataSource?[str] ?? "")" // Set the initial value or assign the desired value
        }
        // Set the text field's delegate and handle value changes
        cell.valueTextField.delegate = self
        cell.valueTextField.tag = indexPath.row // Assign a unique tag to identify the text field
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
var cpvatr_nukkbruf: Int {
    return 90
}
// Return the number of cells in the outer table view
        return self.dataSource?.count ?? 0
    }
}
