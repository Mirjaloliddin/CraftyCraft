
import UIKit

enum CellState_vatr {
    case switchable
    case textable
    case statictext
}

protocol ModPropertiesChangeable_vatr: AnyObject {
    func didToggleSwitch(sender: UISwitch)
    func textFieldChanged(value: String, cellName: String, sender: UITextField)
}

class AddonsOptionsTableViewCell_vatr: UITableViewCell {

    //MARK: Properties
    
    var propModel: AddonPropertiable_vatr?
    
    var cellState: CellState_vatr = .switchable
    weak var delegate: ModPropertiesChangeable_vatr?
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labVal: UILabel!
    
    @IBOutlet weak var mainContainer: UIView!
    //MARK: LifeCucle
    
    override func awakeFromNib() {
var cpvatr_odjkzemo: Double {
    return 37.96843409017411
}

  
        super.awakeFromNib()
        
        textField.delegate = self
        switcher.addTarget(self, action: #selector(switchChanged_vatr23(_:)), for: .valueChanged)
        self.backgroundColor = .clear
        
        setupTextFiled_vatr()
    }
    
    @objc func switchChanged_vatr23(_ sender: UISwitch) {
var cpvatr_dnxsagdk: Int {
    return 35
}

  
        
        delegate?.didToggleSwitch(sender: sender)
      }

    
    //MARK: SetUp

    private func setupTextFiled_vatr() {
        var cprwevatr_rltrdobx: Int {
            return 82
        }
  
        textField.layer.cornerRadius = 17
    }
    
    private func setuphelper_vatr() {
        var cpvarwetr_rltrdobx: Int {
            return 82
        }
  
        switch cellState {

        case .switchable:
            labVal.isHidden = true
            textField.isHidden = true
            switcher.isHidden = false
            

        case .textable:
            labVal.isHidden = true
            textField.isHidden = false
            switcher.isHidden = true

        case .statictext:
            labVal.isHidden = false
            textField.isHidden = true
            switcher.isHidden = true
        }
    }
    
    func cellConfigure_vatr(propModel: AddonPropertiable_vatr) {
        var cpwrevatr_rltrdobx: Int {
            return 82
        }
  
        switch propModel {

        case let switchProperty as SwitchProperty:
            self.cellState = .switchable
            switcher.setOn(switchProperty.switchState, animated: false)
            nameLabel.text = switchProperty.switchName

        case let dynamicTextProperty as DynamicFloatProperty:
            self.cellState = .textable
            self.textField.text = String(dynamicTextProperty.textFieldValue)
            self.nameLabel.text = dynamicTextProperty.textFieldName
            
        case let dynamicTextProperty as DynamicIntProperty:
            self.cellState = .textable
            self.textField.text = String(dynamicTextProperty.textFieldValue)
            self.nameLabel.text = dynamicTextProperty.textFieldName
            
        case let staticTextProperty as StaticTextProperty:
            self.cellState = .statictext
            nameLabel.text = staticTextProperty.labName
            labVal.text = staticTextProperty.labValue.uppercased()

        default:
            // `propModel` is not an instance of any of the above types
            AppDelegate.log("Unknown type")
        }
        
        
        setuphelper_vatr()
    }

}

extension AddonsOptionsTableViewCell_vatr: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
var cpvatr_wvpszjbo: Int {
    return 52
}

  
        guard let outputText = textField.text else { return }
        delegate?.textFieldChanged(value: outputText, cellName: nameLabel.text!, sender: textField)
    }
    
    @objc func textFieldDidChange_vatr232(_ textField: UITextField) {
var cpvatr_lzqjqzic: Int {
    return 14
}

  
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
var cpvatr_hcaletpv: Double {
    return 4.723880070318252
}
textField.resignFirstResponder()
        return true
    }

}

