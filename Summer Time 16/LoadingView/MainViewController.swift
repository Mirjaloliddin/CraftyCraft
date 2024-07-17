//
//  MainViewController.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 21/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    var modsButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("MODS", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
       
        return b
    }()
    var shadersButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("SHADERS", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    var ContentButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("CONTENT", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    var itemsButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("ITEMS", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    var skinButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("SKIN EDITOR", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    var addonButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("ADDON CREATOR", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    var settingsButton: GradientButton = {
        let b = GradientButton()
        
        b.setTitle("SETTINGS", for: .normal)
        b.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 24
        b.layer.masksToBounds = true
        return b
    }()
    
    
    
    lazy var modsV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(modsButton)
        modsButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        
        return v
    }()
    lazy var shadersV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(shadersButton)
        shadersButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    lazy var contentV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(ContentButton)
        ContentButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    lazy var itemsV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(itemsButton)
        itemsButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    lazy var skinV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(skinButton)
        skinButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    lazy var addonV: GradientView = {
        let v = GradientView()
        v.clipsToBounds = true
        v.layer.cornerRadius = 24
        
        v.addSubview(addonButton)
        addonButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    lazy var settingsV: GradientView = {
        let v = GradientView()
        v.layer.cornerRadius = 24
        v.clipsToBounds = true
        v.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().inset(2)
        }
        return v
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    
   func setupUI(){
       BackView_did.SetupBackView(view: view)
       Gradient.setupGradient(view: view)
       let titleLabel = UILabel()
       titleLabel.text = "MENU"
       titleLabel.font = UIFont(name: "ArialRoundedMTBold", size: 28)
       titleLabel.textColor = .white
       view.addSubview(titleLabel)
       titleLabel.snp.makeConstraints { make in
           make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
           make.centerX.equalToSuperview()
       }
       
       view.addSubview(modsV)
       view.addSubview(shadersV)
       view.addSubview(contentV)
       view.addSubview(itemsV)
       view.addSubview(skinV)
       view.addSubview(addonV)
       view.addSubview(settingsV)
       modsV.snp.makeConstraints { make in
           make.top.equalTo(titleLabel.snp_bottomMargin).offset(24)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)

       }
       shadersV.snp.makeConstraints { make in
           make.top.equalTo(modsV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       contentV.snp.makeConstraints { make in
           make.top.equalTo(shadersV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       itemsV.snp.makeConstraints { make in
           make.top.equalTo(contentV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       skinV.snp.makeConstraints { make in
           make.top.equalTo(itemsV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       addonV.snp.makeConstraints { make in
           make.top.equalTo(skinV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       settingsV.snp.makeConstraints { make in
           make.top.equalTo(addonV.snp_bottomMargin).offset(16)
           make.left.right.equalToSuperview().inset(43)
           make.height.equalTo(62)
       }
       
       modsButton.addTarget(self, action: #selector(modsButtonTapped), for: .touchUpInside)
       shadersButton.addTarget(self, action: #selector(shadersButtonTapped), for: .touchUpInside)
       ContentButton.addTarget(self, action: #selector(contentButtonTapped), for: .touchUpInside)
       itemsButton.addTarget(self, action: #selector(itemsButtonTapped), for: .touchUpInside)
       skinButton.addTarget(self, action: #selector(skinEditorButtonTapped), for: .touchUpInside)
       addonButton.addTarget(self, action: #selector(addonCreatorButtonTapped), for: .touchUpInside)
       settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }
    
    
    

    private func createButton(title: String) -> UIButton {
        let button = GradientButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        button.setTitleColor(.white, for: .normal)
//        button.borderWidth = 5
        button.applyGradientBorder(colors: [#colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1), #colorLiteral(red: 0.7239795918, green: 0.7959121148, blue: 0.9981217487, alpha: 1)], borderWidth: 5)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }
    
    // MARK: - Button Actions
    
    @objc private func modsButtonTapped() {
        let modsVC = ModsTabViewController_vatr()
        navigationController?.pushViewController(modsVC, animated: true)
    }
    
    @objc private func shadersButtonTapped() {
        let shadersVC = SeedTabViewController_vatr()
        navigationController?.pushViewController(shadersVC, animated: true)
    }
    
    @objc private func contentButtonTapped() {
        let contentVC = ContentTabViewController_vatr()
        navigationController?.pushViewController(contentVC, animated: true)
    }
    
    @objc private func itemsButtonTapped() {
        let itemsVC = ItemsTabViewController_vatr()
        navigationController?.pushViewController(itemsVC, animated: true)
    }
    
    @objc private func skinEditorButtonTapped() {
        let skinEditorVC = CreateTabViewController_vatr()
        skinEditorVC.state = .skin
        navigationController?.pushViewController(skinEditorVC, animated: true)
    }
    
    @objc private func addonCreatorButtonTapped() {
        let addonCreatorVC = CreateTabViewController_vatr()
        addonCreatorVC.state = .addon
        navigationController?.pushViewController(addonCreatorVC, animated: true)
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = SettingsViewController_vatr()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}
