//
//  CategoryPickerTVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/18/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class MaterialCategoryPickerTVC : UITableViewController {
    var databaseRef : DatabaseReference = Database.database().reference()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
