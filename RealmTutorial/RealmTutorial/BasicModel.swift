//
//  BasicModel.swift
//  RealmTutorial
//
//  Created by Cao Xuan Phong on 7/3/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit
import RealmSwift

//Bool, Int, Int8, Int16, Int32, Int64, Double, Float, String, NSDate, and NSData
//CGFloat
//String, NSDate and NSData (ce be optional)

class BasicModel: Object {
    dynamic var _id : Int = 0
    dynamic var _bool : Bool = false
    dynamic var _int : Int = 0
    dynamic var _int8: Int8 = 0
    dynamic var _int16: Int16 = 0
    dynamic var _int32: Int32 = 0
    dynamic var _int64: Int64 = 0
    dynamic var _double: Double = 0
    dynamic var _float: Float = 0
    dynamic var _ostring: String?
    dynamic var _onsdate: NSDate?
    dynamic var _ondata: NSDate?

    override static func primaryKey() -> String? {
        return "_id"
    }
    
}
