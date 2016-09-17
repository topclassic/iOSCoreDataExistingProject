//
//  ViewController.swift
//  iOSCoreDataExistingProject
//
//  Created by Chotipat on 9/17/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UITableViewController {
    let moc = DataController().managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        checkData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkData(){
     
        let request = NSFetchRequest(entityName: "PersonEntity")
        
        do {
            let fetchedPerson = try moc.executeFetchRequest(request) as! [Person]
            print(fetchedPerson.first!.firstname!)
            print(fetchedPerson.first!.lastname!)
            print(fetchedPerson.first!.ar_id!)
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
        
    }
    func addData(){
    
        let entity = NSEntityDescription.insertNewObjectForEntityForName("PersonEntity", inManagedObjectContext: moc) as! Person
        entity.setValue(12, forKey: "ar_id")
        entity.setValue("Chotipat", forKey: "firstname")
        entity.setValue("Poowongthanarat", forKey: "lastname")

        // we save our entity
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
    }
}

