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

class MaterialTemplateTVC : UITableViewController {
    
    var databaseRef : DatabaseReference = Database.database().reference()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMaterialTemplatesData()
    }
    
    func loadMaterialTemplatesData() {
        databaseRef.child("MaterialTemplates").observe(DataEventType.value, with: { snapshot in
            
            var newTemplates : [String: MaterialTemplate] = [:]
            
            for item in snapshot.children {
                let curItem = item as! DataSnapshot
                newTemplates[curItem.key] = MaterialTemplate(snapshot: curItem)
                print("adding!")
            }
            self.appDelegate.materialTemplates = newTemplates
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
        return appDelegate.materialTemplates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matTempCell", for: indexPath) as? MaterialTemplateCell
        
        let template = [MaterialTemplate](appDelegate.materialTemplates.values)[indexPath.row]
        cell?.category.text = "category: " + template.category.description
        cell?.name.text = "name: " + template.name
        cell?.measured_quantity.text = "measured quantity: " + String(template.measured_quantity)
        cell?.cost.text = "cost: " + String(template.cost)
        
        return (cell)!
    }
    
    
}


