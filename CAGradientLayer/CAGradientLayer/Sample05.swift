//
//  PointViewController.swift
//  CAGradientLayer
//
//  Created by CAO XUAN PHONG on 2/12/18.
//  Copyright © 2018 fiot. All rights reserved.
//

import UIKit

class Sample05: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
         self.makeGradient()
    }
    
    // gradient location
    func makeGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
        
        let location = [NSNumber(value: 0.0), // start 1st color
                        NSNumber(value: 0.2), // start 2nd color
                        NSNumber(value: 0.4), // start 3rd color
                        NSNumber(value: 1.0)] // start 4st color
        
        gradientLayer.locations = location
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
