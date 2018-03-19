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

class MaterialCategoryTVC : UITableViewController {
    
    var databaseRef : DatabaseReference = Database.database().reference()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Categories"
        loadMaterialCategoriesData()
    }
    
    func loadMaterialCategoriesData() {
        databaseRef.child("MaterialCategories").observe(DataEventType.value, with: { snapshot in
            
            var newCategories : [String: MaterialCategory] = [:]
            
            for item in snapshot.children {
                let curItem = item as! DataSnapshot
                newCategories[curItem.key] = MaterialCategory(snapshot: curItem)
            }
            self.appDelegate.materialCategories = newCategories
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
        return appDelegate.materialCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matCatCell", for: indexPath) as? MaterialCategoryCell
        
        let category = [MaterialCategory](appDelegate.materialCategories.values)[indexPath.row]
        cell?.name.text = "name: " + category.name
        cell?.unit.text = "unit: " + category.unit
        return (cell)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        if (segue.identifier == "unwindToAddTemplate") {
            let destVC = destination as? AddMaterialTemplateVC
            let category = [MaterialCategory](appDelegate.materialCategories.values)[(self.tableView.indexPathForSelectedRow?.row)!]
            destVC?.category = category
            destVC?.listLabel.text = category.name
        }
        
    }
}

