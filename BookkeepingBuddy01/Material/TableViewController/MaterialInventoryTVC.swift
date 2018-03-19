//
//  MaterialTemplateTVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

//
//  MaterialCategoryTVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//
import UIKit
import Firebase
import Foundation

class MaterialInventoryTVC : UITableViewController {
    
    var databaseRef : DatabaseReference = Database.database().reference()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMaterialInventoryData()
    }
    
    func loadMaterialInventoryData() {
        databaseRef.child("Materials").observe(DataEventType.value, with: { snapshot in
            
            var newMaterials : [String: Material] = [:]
            
            for item in snapshot.children {
                let curItem = item as! DataSnapshot
                newMaterials[curItem.key] = Material(snapshot: curItem)
                print("adding!")
            }
            self.appDelegate.materials = newMaterials
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.materials.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matCell", for: indexPath) as? MaterialCell
        
        let material = [Material](appDelegate.materials.values)[indexPath.row]
        cell?.name.text = "name: " + material.attribute + " " + material.template.name
        cell?.running_total.text = "measured quantity: " + String(material.running_total)
        cell?.quantity_remaining.text = "cost: " + String(material.quantity_remaining)
        
        return (cell)!
    }
    
    
}



