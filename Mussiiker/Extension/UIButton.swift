//
//  UIButton.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/23.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBlueCornerRadius() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
    func setRedCornerRadius() {
        self.backgroundColor = .blue
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
    func setWhietCornerRadius() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
    func setColorAndCornerRadius(by color: UIColor, by radius: CGFloat) {
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
}
