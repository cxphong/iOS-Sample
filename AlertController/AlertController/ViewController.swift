//
//  ViewController.swift
//  AlertController
//
//  Created by CAO XUAN PHONG on 2/10/18.
//  Copyright © 2018 fiot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showAlert()
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "Do you want to delete this program?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { action in
            NSLog("click ok")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            NSLog("click cancel")
        }))
        
        // Root view
        // UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        
        // Current viewcontroller
        self.present(alert, animated: true) {
            NSLog("Complete show alert")
        }
    }

}

