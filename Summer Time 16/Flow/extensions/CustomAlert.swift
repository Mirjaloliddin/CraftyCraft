//
//  CustomAlert.swift
//  Summer Time 16
//
//  Created by Qudrat on 06/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

import SnapKit

extension UIApplication {
    
    static var keyWindow: UIWindow? {
        
        return shared.windows.first(where: {$0.isKeyWindow})
        
    }
    
}

class CustomAlert: UIView {
    
    
    var completion: ((Bool)->Void)?
    
    class func showAlert(title: String, btnText: String = "DELETE", completion: ((Bool) -> Void)?) {
        let screenSize = UIScreen.main.bounds
        let backgroudView = CustomAlert(frame: screenSize )
        
        backgroudView.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        
        backgroudView.completion = completion
        
        // containerView
        
        let containerView = UIView()
        
        containerView.backgroundColor = #colorLiteral(red: 0.03599932417, green: 0.3426747918, blue: 0.928183496, alpha: 1)
        
        containerView.layer.cornerRadius = 20
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 1
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLbl
        
        let titleLbl = UILabel()
        
        titleLbl.font = .boldSystemFont(ofSize: 22)
        
        titleLbl.text = title
        
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        
        titleLbl.textColor = .white
       
        
        // okBtn
        
        let okBtn = UIButton()
        
        okBtn.backgroundColor = .white
        
        okBtn.setTitle(btnText, for: .normal)
        
        okBtn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        okBtn.setTitleColor(containerView.backgroundColor, for: .normal)
        
        
        okBtn.addTarget(backgroudView, action: #selector(backgroudView.okTapped), for: .touchUpInside)
        
        okBtn.layer.cornerRadius = 28
        
        // cancelBtn
        
        let cancelBtn = UIButton()
        
        cancelBtn.backgroundColor = .clear
        cancelBtn.borderColor = .white
        cancelBtn.borderWidth = 2
        
        cancelBtn.setTitle("CANCEL", for: .normal)
        
        cancelBtn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        cancelBtn.setTitleColor(.white, for: .normal)
        
        cancelBtn.addTarget(backgroudView, action: #selector(backgroudView.cancelTapped), for: .touchUpInside)
        
        cancelBtn.layer.cornerRadius = 28
        
        // containerStackView
        
        let containerStackV = UIStackView()
        
        containerStackV.spacing = 10
        
        containerStackV.distribution = .fill
        
        containerStackV.alignment = .fill
        
        containerStackV.axis = .vertical
        
        // btnStackView
        let btnStackV = UIStackView()
        
        btnStackV.spacing = 12
        
        btnStackV.distribution = .fillEqually
        
        btnStackV.alignment = .fill
        
        btnStackV.axis = .horizontal
        
        //        addSubViews
        
        btnStackV.addArrangedSubview(cancelBtn)
        
        btnStackV.addArrangedSubview(okBtn)
        
        okBtn.snp.makeConstraints { make in
            
            make.height.equalTo(56)
            
        }
        
        containerStackV.addArrangedSubview(titleLbl)
        
        containerStackV.addArrangedSubview(btnStackV)
        
        containerView.addSubview(containerStackV)
        
        containerStackV.snp.makeConstraints { make in
            
            make.left.top.equalTo(20)
            
            make.right.bottom.equalTo(-20)
            
        }
        
        backgroudView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
            
            make.left.equalTo(20)
            
            make.right.equalTo(-20)
            
        }
        containerView.transform = .init(scaleX: 0, y: 0)
        
        if let window = UIApplication.keyWindow {
            
            window.addSubview(backgroudView)
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) {
            
            containerView.transform = .identity
            
        }
        
    }
    
    @objc func okTapped() {
        
        completion?(true)
        
        self.dismissView()
        
    }
    
    @objc func cancelTapped() {
        
        completion?(false)
        
        self.dismissView()
        
    }
    
    func dismissView() {
        
        self.removeFromSuperview()
        
    }
    
}


class InfoCustomAlert: UIView {
    
    
    var completion: (()->Void)?
    
    class func showAlert(title: String, completion: (() -> Void)?) {
        let screenSize = UIScreen.main.bounds
        let backgroudView = InfoCustomAlert(frame: screenSize )
        
        backgroudView.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        
        backgroudView.completion = completion
        
        // containerView
        
        let containerView = UIView()
        
        containerView.backgroundColor = #colorLiteral(red: 0.03599932417, green: 0.3426747918, blue: 0.928183496, alpha: 1)
      
        containerView.layer.cornerRadius = 40
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLbl
        
        let titleLbl = UILabel()
        
        titleLbl.font = .boldSystemFont(ofSize: 22)
        
        titleLbl.text = title
        
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        
        titleLbl.textColor = .white
        
        
       
        
       
        
        let containerStackV = UIStackView()
        
        containerStackV.spacing = 10
        
        containerStackV.distribution = .fill
        
        containerStackV.alignment = .fill
        
        containerStackV.axis = .vertical
        
                
        containerStackV.addArrangedSubview(titleLbl)
        
        containerView.addSubview(containerStackV)
        
        containerStackV.snp.makeConstraints { make in
            
            make.left.top.equalTo(20)
            
            make.right.bottom.equalTo(-20)
            
        }
        
        backgroudView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
            
            make.left.equalTo(20)
            
            make.right.equalTo(-20)
            
        }
        containerView.transform = .init(scaleX: 0, y: 0)
        
        if let window = UIApplication.keyWindow {
            
            window.addSubview(backgroudView)
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) {
            
            containerView.transform = .identity
            
        }
        
    }
    
    @objc func okTapped() {
        
        
        
        self.dismissView()
        
    }
    
    @objc func cancelTapped() {
    
        self.dismissView()
        
    }
    
    func dismissView() {
        
        self.removeFromSuperview()
        
    }
    
}
