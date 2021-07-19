//
//  Person.swift
//  Realm-Sample
//
//  Created by 今村京平 on 2021/07/19.
//

import Foundation
import RealmSwift

// Realm supports the following property types: Bool, Int, Int8, Int16, Int32, Int64, Double, Float, String, Date, and Data.

class Person: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int16 = 0
}
