//
//  PointViewController.swift
//  CAGradientLayer
//
//  Created by CAO XUAN PHONG on 2/12/18.
//  Copyright © 2018 fiot. All rights reserved.
//

import UIKit

class Sample02: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.makeGradient()
    }
    
    // Linear gradient left to right
    func makeGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
