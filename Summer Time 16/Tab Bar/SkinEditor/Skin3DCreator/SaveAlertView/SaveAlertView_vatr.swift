

import UIKit

class SaveAlertView_vatr: UIView {
    
    @IBOutlet var mainSaveAlertView: UIView!
        
    @IBOutlet weak var saveSkButton: UIButton!
    
    @IBOutlet weak var cancelSaveSkButton: UIButton!
    
    @IBOutlet var setSkinNameSaveTextField: UITextField!
    
    @IBOutlet var dialogTextLabel: UILabel!
        
    @IBOutlet weak var defoultDarkBlureEffectView: UIVisualEffectView!
    
    weak var delegate: SkinSavebleDialogDelegate_vatr?
    
    var withExit = false
    
    var withoutTextField = false
    
    var nameCharachterLimit = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        saveAlertViewNibSetup()
        addLeftPaddingToTextField()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        saveAlertViewNibSetup()
        
    }
    
    
    private func saveAlertViewNibSetup() {

  
        mainSaveAlertView = loadSaveAlertViewFromNib()
        mainSaveAlertView.frame = bounds
        mainSaveAlertView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainSaveAlertView.translatesAutoresizingMaskIntoConstraints = true
        cancelSaveSkButton.layer.borderColor = UIColor.white.cgColor
        cancelSaveSkButton.layer.borderWidth = 2
        
        setSkinNameSaveTextField.layer.borderColor = UIColor.white.cgColor
        setSkinNameSaveTextField.layer.borderWidth = 2
        setSkinNameSaveTextField.delegate = self
        dialogTextLabel.text = "Save skin before exitting?".uppercased()
        let placeholderText = "Enter a name"
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.lightGray]
                
        setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
            
        
        let tapGestureOnBlureView = UITapGestureRecognizer(target: self, action: #selector(tapOnBlureViewPressed_vatrer(_:)))
        defoultDarkBlureEffectView.addGestureRecognizer(tapGestureOnBlureView)
        
        addSubview(mainSaveAlertView)
    }
    
    @IBAction func saveSkButtonPressed_vatr(_ sender: UIButton) {

        if withoutTextField {
            if let name = setSkinNameSaveTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), name.isEmpty == false {
                delegate?.saveSkin_vatr(with: name, withExit: withExit)
            } else if let name = setSkinNameSaveTextField.placeholder, name.isEmpty == false {
                delegate?.saveSkin_vatr(with: name, withExit: withExit)
            }
        } else {
            if setSkinNameSaveTextField.isHidden {
                setSkinNameSaveTextField.isHidden = false
                dialogTextLabel.text = "Save skin before exitting?".uppercased()
            } else {
                guard let nameSkin = setSkinNameSaveTextField.text else {
                    showInputInvalidAllert_vatr(title: "Invalid Name", message: "Please provide another name")
                    return
                }

                if nameSkin.isEmpty {
                    guard let placeholder = setSkinNameSaveTextField.placeholder  else {
                        showInputInvalidAllert_vatr(title: "Invalid Name", message: "Please provide another name")
                        return
                    }
                    delegate?.saveSkin_vatr(with: placeholder, withExit: withExit)
                } else if !isInputValid(nameSkin) {
                    showInputInvalidAllert_vatr(title: "Warning!", message: "Invalid name, please provide another name")
                } else {
                    
                    delegate?.saveSkin_vatr(with: nameSkin, withExit: withExit)
                }
            }
        }
    }
    
    @IBAction func cancelSaveSkButtonPressed_vatr(_ sender: UIButton) {
        delegate?.cancelSave_vatr(withExit: withExit)
    }
    
    private func loadSaveAlertViewFromNib() -> UIView {

let volNib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let volNibView = volNib.instantiate(withOwner: self, options: nil).first as! UIView
        return volNibView
    }
}

extension SaveAlertView_vatr: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

// get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 15 characters
        guard updatedText.count <= nameCharachterLimit else {
            showInputInvalidAllert_vatr(title: "Name Too Long", message: "The name must be \(nameCharachterLimit) characters or fewer.")
            return false
        }

        // name can't starts from whitespace
        guard updatedText.hasPrefix(" ") == false else {
            return false
        }

        // If the updated text is empty, it means we are deleting characters, so allow it.
        if updatedText.isEmpty {
            return true
        }

        var characterSet = CharacterSet.alphanumerics
        // only need the decimal character added to the character set
        characterSet.insert(charactersIn: "._- ")

        return updatedText.rangeOfCharacter(from: characterSet) != nil
    }


}

extension SaveAlertView_vatr {
    @objc func tapOnBlureViewPressed_vatrer(_ sender: UITapGestureRecognizer) {

  
        if setSkinNameSaveTextField.isFirstResponder {
            setSkinNameSaveTextField.resignFirstResponder()
        }
    }
}

extension SaveAlertView_vatr {
    func addLeftPaddingToTextField() {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setSkinNameSaveTextField.frame.height))
        setSkinNameSaveTextField.leftView = paddingView
        setSkinNameSaveTextField.leftViewMode = .always
    }
}


extension SaveAlertView_vatr {

//Checks if user provided allowed skin name
    func isInputValid(_ input: String) -> Bool {

// Remove leading and trailing whitespaces and newlines
        let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if the cleaned input is not empty (contains at least one visible character)
        return !cleanedInput.isEmpty
    }
    
    func showInputInvalidAllert_vatr(title: String, message: String) {

        let warningAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let warningAlertControllerOkAction = UIAlertAction(title: "Ok", style: .default)
        warningAlertController.addAction(warningAlertControllerOkAction)
        delegate?.warningNameAlert_vatr(presentAlert: warningAlertController)
    }
}
