//
//  MaterialCategory.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 2/1/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import FirebaseDatabase

class MaterialCategory : Codable {
    
    var name: String
    var unit: String
    var description: String { return name }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case unit
    }
    
    init(name: String, unit: String) {
        self.name = name
        self.unit = unit
    }
    
    init(snapshot: DataSnapshot) {
        let snapvalues = snapshot.value as! [String : AnyObject]
        name = snapvalues["name"] as! String
        unit = snapvalues["unit"] as! String
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
            "name" : name,
            "unit" : unit
        ]
    }
    
}


