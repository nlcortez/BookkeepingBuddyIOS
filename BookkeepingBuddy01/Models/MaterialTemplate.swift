//
//  MaterialTemplate.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import FirebaseDatabase

class MaterialTemplate : Codable {
    
    var category: MaterialCategory
    var name: String
    var measured_quantity: Int
    var cost: Double
    
    private enum CodingKeys: String, CodingKey {
        case category
        case name
        case measured_quantity
        case cost
    }
    
    init(category: MaterialCategory, name: String, measured_quantity: Int, cost: Double) {
        self.category = category
        self.name = name
        self.measured_quantity = measured_quantity
        self.cost = cost
    }
    
    init(snapshot: DataSnapshot) {
        let snapvalues = snapshot.value as! [String : AnyObject]
        
        let databaseRef : DatabaseReference = Database.database().reference()
        var newCategory : MaterialCategory? = MaterialCategory(name: snapvalues["category"] as! String, unit:"")
        let query = databaseRef.queryOrdered(byChild: "MaterialCategories").queryEqual(toValue: snapvalues["category"] as! String)
        query.observeSingleEvent(of: .value) { snapshot in
            for item in snapshot.children {
                newCategory = MaterialCategory(snapshot: item as! DataSnapshot)
            }
        }
        newCategory = MaterialCategory(name: snapvalues["category"] as! String, unit:"")
        category = newCategory!
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
            "category" : category.name,
            "name" : name,
            "measured_quantity" : measured_quantity,
            "cost" : cost
        ]
    }
    
}

