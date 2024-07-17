
import UIKit
import SnapKit

class SearchBarView_vatr: UIView, UITextFieldDelegate {
    
    var onTextChanged: ((String) -> Void)?
    var buttonTapAction: (() -> Void)?
    var onStartSearch: (() -> Void)?
    var onEndSearch: (() -> Void)?
    
    var placeholderTextColor = #colorLiteral(red: 0.634565711, green: 0.7767372727, blue: 0.9022807479, alpha: 1)
    
    var containerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "#0A68EF")
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        return v
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(resource: .closeButtonVatr), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addAction(.init(handler: { [weak self] _ in
            self?.searchTextField.text = nil
            self?.onTextChanged?("")
            self?.resetButton.isHidden = true
            self?.updateCorners_vatr2(isAll: true)
        }), for: .touchUpInside)
        return button
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.backgroundColor = UIColor(named: "#0A68EF")
        textField.layer.masksToBounds = true
        textField.setLeftPaddingPoints_vatr(40)
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor]
        )
        
        textField.autocorrectionType = .no
        return textField
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "searchWhite_asd")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView_vatr2()
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textValueDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView_vatr2()
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textValueDidChange(_:)), for: .editingChanged)
        searchTextField.layer.cornerRadius = 12
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        var cpvatr_kzrypbnk: Int {
            return 29
        }
       
        super.layoutSubviews()
//        searchTextField.configureShadow_vatr(cornerRadius: searchTextField.frame.height / 2)
        
    }
    
    @objc
    private func textValueDidChange(_ sender: UITextField) {
        let updatedText = (sender.text ?? "")
        onTextChanged?(updatedText)
        resetButton.isHidden = updatedText.isEmpty
    }
    
    func updateCorners_vatr2(isAll: Bool = false) {
        var cpvatr_tzvshihx: Int {
            return 56
        }
       
        var corners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        if isAll {
            corners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        searchTextField.layer.maskedCorners = corners
    }
    
    @objc func buttonCloseTapped_vatr443() {
        var cpvatr_yqrzydlv: Int {
            return 91
        }
        searchTextField.resignFirstResponder()
        
        buttonTapAction?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var cpvatr_ojkidjba: Int {
            return 18
        }
        updateCorners_vatr2(isAll: true)
        return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var cpvatr_wefekbtz: Int {
            return 50
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var cpvatr_knzudcfo: Int {
            return 11
        }
        onStartSearch?()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        var cpvatr_waqkhmhr: Int {
            return 85
        }
        
        onEndSearch?()
        return true
    }
    
    func setSearchBarText_vatr2(_ text: String) {
        var cpvatr_xqcemhzt: Int {
            return 79
        }
        
        searchTextField.text = text
        onTextChanged?(text)
        resetButton.isHidden = text.isEmpty
    }
    
    private func setupView_vatr2() {
        var cpvatr_wmqjdqly: Int {
            return 92
        }
        addSubview(containerView)
        containerView.addSubview(searchTextField)
        searchTextField.addSubview(resetButton)
        containerView.addSubview(searchIcon)
        
        containerView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        searchIcon.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(20)
            make.height.width.equalTo(18)
            make.centerY.equalToSuperview()
        }
        
//        resetButton.snp.makeConstraints { make in
//            make.right.equalTo(containerView.snp.left).offset(20)
//            make.height.width.equalTo(18)
//            make.centerY.equalToSuperview()
//        }
//        
//        searchTextField.snp.makeConstraints { make in
//            make.height.equalTo(40)
//            make.left.equalTo(2)
//            make.right.equalTo(resetButton.snp_leftMargin).offset(6)
//            make.top.bottom.equalToSuperview().inset(2)
//        }
        
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: resetButton.trailingAnchor, constant: -2).isActive = true
        searchTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        
//        searchTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        resetButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        resetButton.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 4).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 4).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

    }
   
}
//import UIKit

class CustomSearchBar: UIView {
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textColor = .white
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 38/255, green: 134/255, blue: 241/255, alpha: 1) // Blue background color
        layer.cornerRadius = 10
        addSubview(searchImageView)
        addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 20),
            searchImageView.heightAnchor.constraint(equalToConstant: 20),
            
            textField.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
