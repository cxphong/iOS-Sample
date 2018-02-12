//
//  PointViewController.swift
//  CAGradientLayer
//
//  Created by CAO XUAN PHONG on 2/12/18.
//  Copyright © 2018 fiot. All rights reserved.
//

import UIKit

class Sample04: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
         self.makeGradient()
    }
    
    // Linear gradient horizonal
    func makeGradient() {
        let gradientLayer = CAGradientLayer()
        
        let x = (self.view.frame.size.height - self.view.frame.size.width) / -2
        let y = (self.view.frame.size.height - self.view.frame.size.width) / 2
        
        gradientLayer.frame = CGRect(x: x,
                                     y: y,
                                     width: self.view.frame.size.height,
                                     height: self.view.frame.size.width)
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
        
        gradientLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        NSLog("frame \(gradientLayer.frame)")
    }
    
}
