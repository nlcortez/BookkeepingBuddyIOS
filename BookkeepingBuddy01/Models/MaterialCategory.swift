//
//  MaterialCategory.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 2/1/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import FirebaseDatabase

class MaterialCategory : Codable {
    var id: String
    var name: String
    var unit: String
    var description: String { return name }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case unit
    }
    
    init(id: String, name: String, unit: String) {
        self.id = id
        self.name = name
        self.unit = unit
    }
    
    init(snapshot: DataSnapshot) {
        let snapvalues = snapshot.value as! [String : AnyObject]
        id = snapvalues["id"] as! String
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
            "id" : id,
            "name" : name,
            "unit" : unit
        ]
    }
    
}


