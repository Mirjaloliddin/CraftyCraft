

import UIKit

class SizeCollectionViewCell_vatr: UICollectionViewCell {
    
    static let reuseID = "sizesCell"
    private let viewX: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.51412642, green: 0.6992784142, blue: 0.9710304141, alpha: 1)
        v.clipsToBounds = true
        v.layer.cornerRadius = 2
        v.snp.makeConstraints { make in
            make.width.height.equalTo(4)
        }
        return v
    }()
    private let labelX: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.kufamFont(.medium, size: 10)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    
    override var isSelected: Bool {
        get {
            super.isSelected
        } set {
            super.isSelected = newValue
            layer.borderWidth = newValue ? 1.5 : 0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout_vatr()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {

        super.layoutSubviews()
        labelX.layer.cornerRadius = 8
        layer.cornerRadius = bounds.height / 2
        
    }
    
    func configCell_vatr(label: String, isSelected: Bool) {
  
        labelX.text = label
        self.isSelected = isSelected
    }
    
}

extension SizeCollectionViewCell_vatr {
    private func makeLayout_vatr() {
        contentView.addSubview(viewX)
        contentView.addSubview(labelX)
        
        viewX.snp.makeConstraints { make in
            make.top.equalTo(4)
            make.centerX.equalTo(contentView.snp_centerXWithinMargins)
        }
        labelX.snp.makeConstraints { make in
            make.top.equalTo(viewX.snp_bottomMargin).offset(12)
            make.left.right.equalToSuperview().inset(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(6)
        }
        
//        NSLayoutConstraint.activate([
//            labelX.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
//            labelX.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
//            labelX.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
//            labelX.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
//        ])
        
        labelX.layer.masksToBounds = true
        
        layer.masksToBounds = true
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0
    }
}
