//
//  Ex+UIView.swift
//  Summer Time 16
//
//  Created by Qudrat on 02/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    // Gradient qatlamini aniqlang
    private var gradientLayer: CAGradientLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
    }
    
    // Gradient qatlamini sozlash
    private func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        // Gradient ranglarini belgilash
        gradientLayer.colors = [
            #colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1).cgColor,
            #colorLiteral(red: 0.7254901961, green: 0.7960784314, blue: 1, alpha: 1).cgColor
        ]
        
        
        
        // Gradient lokatsiyalarini (opsional) belgilash
        gradientLayer.locations = [0.0, 1.0]
        
        // Gradient boshlanish va tugash nuqtalarini (opsional) belgilash
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // Gradient qatlamini ko'rinish qatlamiga qo'shing
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Gradient qatlamining o'lchamini yangilang
        gradientLayer.frame = self.bounds
    }
}
