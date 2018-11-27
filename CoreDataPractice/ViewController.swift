//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Cahyanto Setya Budi on 11/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("Danang", forKey: "firstName")
        newUser.setValue("Triyatno", forKey: "lastName")
        newUser.setValue(10, forKey: "age")
        newUser.setValue("Kroya", forKey: "city")
        try! context.save()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        let result = try! context.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "firstName") as! String)
        }
    }
}

