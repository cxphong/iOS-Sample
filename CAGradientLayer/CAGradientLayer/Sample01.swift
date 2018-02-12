//
//  ViewController.swift
//  CAGradientLayer
//
//  Created by CAO XUAN PHONG on 2/12/18.
//  Copyright © 2018 fiot. All rights reserved.
//

import UIKit

class Sample01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.makeGradient()
    }

    // Linear gradient vertical
    func makeGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

}

