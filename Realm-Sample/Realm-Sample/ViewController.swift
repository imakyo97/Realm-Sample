//
//  ViewController.swift
//  Realm-Sample
//
//  Created by 今村京平 on 2021/07/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressInitButton(_ sender: Any) {
        let realm = try! Realm()

        try! realm.write {
            realm.deleteAll()
        }
        print("削除完了")

        let person1 = Person()
        person1.name = "sato"
//        person1.age = 33
        person1.age = Int16.random(in: 1...100)

        let person2 = Person()
        person2.name = "suzuki"
//        person2.age = 44
        person2.age = Int16.random(in: 1...100)

        let person3 = Person()
        person3.name = "tanaka"
//        person3.age = 55
        person3.age = Int16.random(in: 1...100)

        try! realm.write {
            realm.add(person1)
            realm.add(person2)
            realm.add(person3)
        }
        print("追加完了")
        print("========")
    }

    @IBAction func pressReadButton(_ sender: Any) {
//        let persons = try! Realm().objects(Person.self)
        let persons = try! Realm().objects(Person.self).sorted(byKeyPath: "age")
//        let persons = try! Realm().objects(Person.self).sorted(byKeyPath: "age", ascending: false)

        print("========")
        for person in persons {
            print("name = \(person.name), age = \(person.age)")
        }
    }

    @IBAction func pressReadSButton(_ sender: Any) {
        let persons = try! Realm().objects(Person.self).filter("name BEGINSWITH 's'")
        print("========")
        for person in persons {
            print("name = \(person.name), age = \(person.age)")
        }
    }

    @IBAction func pressUpdateButton(_ sender: Any) {

        let realm = try! Realm()
        let persons = realm.objects(Person.self)
        try! realm.write {
            for person in persons {
                person.name += "*"
            }
        }
        print("更新完了")
    }

    @IBAction func pressUpdateAllButton(_ sender: Any) {
        let realm = try! Realm()
        let persons = realm.objects(Person.self)
        try! realm.write {
            persons.setValue("******", forKey: "name")
        }
    }

    @IBAction func pressDelete(_ sender: Any) {
        let persons = try! Realm().objects(Person.self).filter("name BEGINSWITH 's'")

        var personsArray: [Object] = []
        for person in persons {
            personsArray.append(person)
        }
        // let personsArray:[Object] = map(persons) {$0}

        let realm = try! Realm()

        try! realm.write {
            for person in personsArray {
                realm.delete(person)
            }
        }
        print("削除完了")
        print("========")
    }

    @IBAction func pressDeleteAll(_ sender: Any) {
        let realm = try! Realm()

        try! realm.write {
            realm.deleteAll()
        }
        print("削除完了")
        print("========")
    }

}

