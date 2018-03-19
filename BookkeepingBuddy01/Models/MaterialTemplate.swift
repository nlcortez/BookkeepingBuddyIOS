//
//  MaterialTemplate.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class MaterialTemplate : Codable {
    
    var id: String
    var category: MaterialCategory
    var name: String
    var measured_quantity: Int
    var cost: Double
    
    private enum CodingKeys: String, CodingKey {
        case id
        case category
        case name
        case measured_quantity
        case cost
    }
    
    init(id: String, category: MaterialCategory, name: String, measured_quantity: Int, cost: Double) {
        self.id = id
        self.category = category
        self.name = name
        self.measured_quantity = measured_quantity
        self.cost = cost
    }
    
    init(snapshot: DataSnapshot) {
        let snapvalues = snapshot.value as! [String : AnyObject]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        id = snapvalues["id"] as! String
        category = appDelegate.materialCategories[snapvalues["categoryId"] as! String]!
        name = snapvalues["name"] as! String
        measured_quantity = snapvalues["measured_quantity"] as! Int
        cost = snapvalues["cost"] as! Double
    }

    func retrieveCategory(categoryName: String) -> MaterialCategory {
        let databaseRef : DatabaseReference = Database.database().reference()
        var category : MaterialCategory? = nil
        let query = databaseRef.queryOrdered(byChild: "MaterialCategories").queryEqual(toValue: categoryName)
        query.observeSingleEvent(of: .value) { snapshot in
            for item in snapshot.children {
                category = MaterialCategory(snapshot: item as! DataSnapshot)
            }
        }
        return category!
    }
    
    func toAnyObject() -> Any {
        return [
            "id" : id,
            "categoryId" : category.id,
            "name" : name,
            "measured_quantity" : measured_quantity,
            "cost" : cost
        ]
    }
    
}

