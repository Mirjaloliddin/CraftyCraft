//
//  ColorsVC.swift
//  Summer Time 16
//
//  Created by Qudrat on 09/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate: AnyObject {
    func colorPickerViewControllerDidSelectColor(_ color: UIColor)
}

class ColorPickerViewController: UIViewController {
    
    weak var delegate: ColorPickerViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        addChild(colorPicker)
        view.addSubview(colorPicker.view)
        colorPicker.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorPicker.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorPicker.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorPicker.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            colorPicker.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        colorPicker.didMove(toParent: self)
    }
}

extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController, didSelect color: UIColor) {
        delegate?.colorPickerViewControllerDidSelectColor(color)
        dismiss(animated: true, completion: nil)
    }
}

