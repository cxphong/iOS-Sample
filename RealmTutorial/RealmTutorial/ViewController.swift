//
//  ViewController.swift
//  RealmTutorial
//
//  Created by Cao Xuan Phong on 7/3/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var b : BasicModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        b = BasicModel()
        b._bool = true
        b._double = 1.0
        b._float = 3
        b._id = 0
        b._int = 5
        b._int16 = 4
        b._int32 = 5
        b._int64 = 5
        b._int8 = 0
        b._ondata = nil
        b._onsdate = nil
        b._ostring = nil
        
        self.save()
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async {
            let realm = try! Realm()

            try! realm.write {
                realm.add(self.b, update: true)
            }
            
            self.readRealm()
        }
       
    }
    
    func readRealm() {
        DispatchQueue.global(qos: .background).async {
            let realm = try! Realm()
            
            let result = realm.objects(BasicModel.self)
            try! realm.write {
                for  r in result {
                    r._bool = true
                    NSLog("model = %@", r)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

